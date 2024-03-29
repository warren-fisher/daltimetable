import requests as reqs
import re
import time

# Use for escaping strings which are put directly into a file.
import pymysql as mysql 

def clean(s):
    """
    Remove unnecesary junk from match (eg. &agb&adfadsf) that means nothing
    Used for parsing the days a class is available (empty spots have this junk)
    """
    for l in s:
        if l == '&':
            return ''
        if ord(l) >= ord('A') and ord(l) <= ord('Z'):
            return l
    return ' '

def decode_type(t):
    """
    Match the <td CLASS="dett(.)"...> where (.) is a certain letter corresponding to the type of class
    """
    if t == 'b':
        return 'lab'
    if t == 'l':
        return 'lecture'
    if t == 't':
        return 'tutorial'
    if t == 'w':
        return 'workterm'
    if t == 's':
        return 'study'

def escape_sql(s):
    """
    Escape this SQL string so no SQL injection occurs.

    Args:
        s (string): string to escape

    Returns:
        string: string with characters escaped per MySQL
    """
    return mysql.escape_string(s)


matcher = re.compile("""<b>(([A-Z]{4}) (\d*[^<]*))|(
<td CLASS="dett(.)">(.*)</td>
<td CLASS="dett."><b>(.*)</b></td>
<td CLASS="dett.">(.*)</td>
<td CLASS="dett.">(.*)</td>
<td CLASS="dett.">(.*)</td>
<td CLASS="dett.">(.*)</td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP>(.*?(\d*)-(\d*)|(C/D))</td>)""", re.MULTILINE)

# Match groups for regex
# 1 = match first regex
# 2 = match department code
# 3 = match class name (needs to change)
# 4 = match 5-18
# 5 = match if its a lab, tutorial, or class
# 6 = notes (sometimes a link to JS popup)
# 7 = CRN
# 8 = class number (01, T01, B01)
#TODO: why two link columns? pre sure real one is #11
# 9 = link column (for what???)
# 10 = credit hours
#TODO: link column
# 11 = link column (used if a class has labs/tutorials that match with specific lectures)
# 12 = if monday
# 13 = if tuesday
# 14 = if wednesday
# 15 = if thursday
# 16 = if friday
# 17 = match either times or asynchronous class
# 18 = start time
# 19 = end time
# 20 = matches asynchronous class therefore has no time

class ClassInfo():
    """
    Object to store all the lectures and tutorials/labs that a class has.
    Must be careful because sometimes only certain labs/tutorials are valid with certain lecture times.
    """
    
    def __init__(self, name, code, lectures, department, term_code, dis_code, labs=None, tutorials=None):
        """
        Initiate an object representing a single course.

        Args:
            name (string): the course's name
            code (int): the course code, eg. 3172 for CSCI 3172
            lectures (array): all the different lectures for this course
            department (string): the department code, eg. CSCI for CSCI 3172
            term_code (int): the code (eg. 8) associated with the term this course is in
            dis_code (int): the code (eg. 400) associated with the district this course is in
            labs (array, optional): The labs associated with this course. Defaults to None.
            tutorials (array, optional): The tutorials associated with this course. Defaults to None.
        """
        self.name = name
        self.code = code
        self.district_code = dis_code
        self.lectures = lectures
        self.department = department
        self.year = year
        self.term = term
        self.term_code = term_code
        if labs is not None:
            self.labs = labs
        if tutorials is not None:
            self.tutorials = tutorials

    def __str__(self):
        """
        Generically create a string representing all the lectures and labs associated with a single course.
        """
        s = f"{self.department} {self.code} {self.name}\n"
        for class_ in self.lectures:
            s += str(class_) + "\n"
        for lab in self.labs:
            s += str(lab) + "\n"
        return s

    def store(self):
        """
        Store all the information about this course (lectures, labs) in the generated SQL file.
        """
        # DO NOT nest these because then there will be duplicated labs for each different lecture
        for lecture in self.lectures:
            lecture.store()
        for lab in self.labs:
            lab.store()
        for tut in self.tutorials:
            tut.store()

        # Must store this information after lec/lab/tut info because of foreign key constraints
        for lecture in self.lectures:
            for tut_or_lab in self.labs+self.tutorials:
                self._store_lab_lec_relation(lecture.crn, tut_or_lab.crn)

    def _store_lab_lec_relation(self, lec_crn, lab_crn):
        """
        Write the lecture-lab pair to sql. Tutorials are treated equivalenty to labs.
        """
        sql = f"""INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        ({self.term_code}, {lec_crn}, {lab_crn});\n"""

        with open('database.sql', 'a') as f:
            f.write(sql)

class Timeslot():
    """
    Superclass for storing generic information about anything that may occupy a timeslot
    """

    def __init__(self, name, term_code, code, type_, crn, identifier, credit_hours, days, start_time, end_time, department):
        """
        Store generic information about something happening at a certain time

        Args:
            name (string): the name of this thing
            term_code (string): The code for the term this is in
            code (int): the course code, eg. 3172 for CSCI 3172
            type_ (string): where it is a lecture, lab or tutorial
            crn (string): the course registration number, often 5 digits eg. 25193
            identifier (string): the identifier for this, eg. T01 for Tutorial 1, L03 for Lab 3
            credit_hours (int): the number of credit hours, eg. 3 is regular for a class
            days (string): what days this class is on, eg MWF
            start_time (string): the start time, eg. 1135
            end_time (string): the end time, eg 1235
            department (string): the department this is in
        """
        self.name = escape_sql(name)
        # Don't need to escape integer
        self.term_code = term_code
        self.code = code
        
        self.type_ = escape_sql(type_)
        self.crn = escape_sql(crn)
        self.identifier = escape_sql(identifier)
        
        # Don't need to escape integer
        self.credit_hours = credit_hours
        
        self.days = escape_sql(days)
        self.start_time = escape_sql(start_time)
        self.end_time = escape_sql(end_time)
        self.department = escape_sql(department)

    def __str__(self):
        """
        Generically create a string to output to console.
        """
        return f"{self.department=} {self.code=} {self.name=} {self.identifier=} {self.type_=} {self.crn=} {self.days=} {self.start_time=}-{self.end_time=} {self.credit_hours=}"

    @staticmethod
    def time_convert(time):
        """
        Convert a time string eg. 1159 to the neccesary SQL to convert from a string to MySQL date column.

        Args:
            time (string): the time string eg 1159

        Returns:
            (string): the neccesary SQL that will result in a valid MySQL date
        """
        return f"TIME(STR_TO_DATE('{time}', '%k%i'))"


class LabInfo(Timeslot):
    """
    Class to represent a lab or tutorial. They can be treated identically except when displaying whether it is a lab or tutorial.
    It is perhaps possible for a class to have a lab and a tutorial, but that is probably fine.
    """

    def __init__(self, tutorial=None, **kwargs):
        if tutorial != None:
            self.tutorial = tutorial
        else:
            self.tutorial = False
        super().__init__(**kwargs)


    def _sql(self):
        """
        Store this lab or tutorial in the SQL.
        """
        if self.tutorial:
            is_tutorial = 1
        else:
            is_tutorial = 0

        sql = f"""\nINSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES ({self.crn}, {self.term_code}, '{self.days}', {Timeslot.time_convert(self.start_time)},
        {Timeslot.time_convert(self.end_time)}, {is_tutorial});\n
        """

        return sql

    def store(self):
        """
        Store this Lab or Tutorial in the SQL file.
        """
        with open('database.sql', 'a') as f:
            f.write(self._sql())

class LectureInfo(Timeslot):
    """
    Class to represent a lecture timeslot. Contains information about its labs/tutorials (if it has any)
    """

    def __init__(self, dis_code, **kwargs):
        self.district_code = dis_code
        super().__init__(**kwargs)

    def _sql(self):
        """
        Generate the SQL relating to this lecture.
        """
        sql = f"""\nINSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS, DIS_CODE) VALUES ({self.crn}, {self.term_code}, '{self.code}', '{self.name}', '{self.department}', '{self.days}',
        {Timeslot.time_convert(self.start_time)}, {Timeslot.time_convert(self.end_time)}, {self.credit_hours}, {self.district_code});\n"""

        return sql

    def store(self):
        """
        Write the SQL relating to this lecture in the database file.
        """
        with open('database.sql', 'a') as f:
            f.write(self._sql())

def time_setup(match, code, class_name, department, term_code):
    """
    Clean the regex up

    match = regex matching
    class_name is the name of the class, or the name of the class the lab belongs to
    """
    cached = {'name':class_name, 'department':department, 'code':code, 'term_code':term_code}
    cached['type_'] = decode_type(match.group(5))
    cached['crn'] = match.group(7)
    cached['identifier'] = match.group(8)
    credits_hours = match.group(10)
    # Sometimes a random character (-) shows up on the academic timetable. Probably a typo but we'll put it at 0
    try:
        int(credits_hours)
        cached['credit_hours'] = credits_hours
    except ValueError:
        cached['credit_hours'] = 0

    # Groups 12-16 are for the days
    days = ''
    for i in range(12, 17):
        day = clean(match.group(i))
        if day.lower() not in ['m', 't', 'w', 'r', 'f']:
            continue
        days += day
    cached['days'] =  days

    if match.group(18):
        cached['start_time'] = match.group(18)
        cached['end_time'] = match.group(19)
    else:
        cached['start_time'] = '0001'
        cached['end_time'] = '2359'
    return cached

def classes_on_pg(link, term_code, dis_code):
    """
    Get all the classes within a page (not including work/study terms)
    """

    resp = reqs.get(link)
    classes = []
    cached = {}
    for match in matcher.finditer(resp.text):

        # Match first group containing department and name
        if match.group(1):
            
            # Process the previous cached class (if there is one)
            if cached != {}:
                # If it has no labs/tutorials/lectures then we dont need to consider this class (such as a work/study term)
                if (len(cached['labs']) + len(cached['tutorials']) + len(cached['lectures'])) == 0:
                    cached = {}
                else:
                    classes.append(ClassInfo(**cached))
                    cached = {}
            cached['department'] = match.group(2)
            class_code, name = match.group(3).split(maxsplit=1)
            cached['name'] = name
            cached['code'] = class_code
            cached['labs'] = []
            cached['tutorials'] = []
            cached['lectures'] = []
            cached['term_code'] = term_code
            cached['dis_code'] = dis_code

        # Match lecture/tutorial/lab info
        elif match.group(4):
            if (type_ := decode_type(match.group(5))) != 'lecture':

                # These types of classes dont matter to us
                if type_ in ['workterm', 'study', None]:
                    continue
                if type_ == 'tutorial':
                    lab = LabInfo(True, **time_setup(match, cached['code'], cached['name'], cached['department'],
                                                     cached['term_code']))
                else:
                    lab = LabInfo(**time_setup(match, cached['code'], cached['name'], cached['department'],
                                               cached['term_code']))
                cached[type_ + 's'].append(lab)
            else:
                lecture = LectureInfo(cached['dis_code'], **time_setup(match, cached['code'], cached['name'],
                                                cached['department'], cached['term_code']))
                cached['lectures'].append(lecture)
    return classes

def get_classes_by_dept(department, link, year, term):
    """
    Get all the classes (that are not work/study terms) from a specific department
    """
    original_link = link
    classes = []
    i = 0
    for district, dis_code in districts.items():
        while True:
            pg_num = 20*i + 1
            link = original_link + f"{department}" + r"&s_numb=&n=" + f"{pg_num}" + r"&s_district=" + f"{dis_code}"
            print(link)
            term_code = get_term_code(year, term)

            results = classes_on_pg(link, term_code, dis_code)
            if len(results) == 0:
                break
            for c in results:
                classes.append(c)
            i += 1
    return classes

def get_all_dept(link):   
    """
    Get all the names and acronyms of the Dalhousie departments displayed from this link. 
    Normally, the link shows all the departments in a specific term ie Winter

    Args:
        link (raw string): the link to view departments for this term

    Returns:
        dictionary: Maps department acronym to its full name.
    """     
    resp = reqs.get(link)
    dept_matcher = re.compile("""<a href="fysktime\.P_DisplaySchedule\?s_term=(.*)&s_subj=([A-Za-z]{4})&s_district=All">(.*)</a>""")
    depts = {}
    for match in dept_matcher.finditer(resp.text):
        depts[match.group(2)]=match.group(3)

    return depts

def get_term_code(yr, term):
    """
    Calculate the term code of a specific year and term pair. Works until 2051.
    """
    term_ids = {'Winter':0, 'Summer': 1, 'Fall':2}

    # Can store up to 32 years past 2019 in the future in 2 digits, (2051 - 2019) * 3 = 96 + 2
    term_code = (int(yr) - 2019) * 3 + term_ids[term]
    return term_code

##
## Functions to store some basic SQL 
##

def store_term(yr, term):
    """
    Store the term code into the database SQL file.
    """
    term_code = get_term_code(yr, term)
    
    # All of the inserted values are hardcoded and need not be escaped
    sql = f"""\nINSERT INTO terms (T_CODE, YR, TERM) VALUES ({term_code}, {yr}, '{term}');\n"""

    with open('database.sql', 'a') as f:
        f.write(sql)

def store_district(name, code):
    """
    Store the term code into the database SQL file.
    """
    
    # Code is an integer and need not be escaped
    sql = f"""\nINSERT INTO districts (DIS_CODE, DIS_NAME) VALUES ({code}, '{escape_sql(name)}');\n"""

    # We append since the database.sql file already has some of the DDL SQL in it.
    with open('database.sql', 'a') as f:
        f.write(sql)
        
def store_dept(dept, name):
    """
    Function for writing the department code and name to sql, along with adding a comment
    so that the sql is easier to read.
    """
    s = f'###################### "{escape_sql(name)}" ######################\n'
    sql = '\n'
    # Subtract one because of adding newline char at end
    sql += '#'*(len(s)-1) + '\n'
    sql += s
    sql += '#'*(len(s)-1) + '\n'
    sql += f"INSERT INTO department VALUES ('{escape_sql(dept)}','{escape_sql(name)}');\n"
    
    with open('database.sql', 'a') as f:
        f.write(sql)

# The links of the department list for each term
getTermDept = {"2021 Summer": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202130&s_district=All",
               "2021 Fall": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202210&s_district=All",
               "2022 Winter": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202220&s_district=All"}

# The start of the links for the different terms. We will append to them to specify query parameters.
terms = {"2021 Summer": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202130&s_subj=",
         "2021 Fall": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202210&s_subj=",
         "2022 Winter": r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202220&s_subj="}

# Our district codes
districts = {
    "Halifax": 100,
    "Truro": 200,
    "Online": 300,
    "Other": 400,
}

# Get the DDL SQL from the template file
database_sql = ""
with open('template.sql', 'r') as f:
    database_sql = f.read()

# Write it in the output file
# Use write mode because we fully want to replace whatever was there before
with open('database.sql', 'w') as f:
    f.write(database_sql)

# Store all the terms at the start to ensure foreign key constraints.
for key in terms:
    year, term = key.split()
    store_term(year, term)

# Store all the districts next to ensure foreign key constraints.
for name, code in districts.items():
    store_district(name, code)

# Get all the departments for each term
all_depts = {}
# Get all the departments merged into one dictionary
merge_depts = {}
for term_name, link in getTermDept.items():
    depts = get_all_dept(link)
    all_depts[term_name] = depts
    # Merge them together
    merge_depts = {**merge_depts, **depts}

# Store the DDL SQL of all districts
for dept, name in merge_depts.items():
    # Store the department first to ensure foreign key constrain.
    store_dept(dept, name)

# For each term store all classes from the departments in that term
for term_name in terms: 
    year, term = term_name.split()
    # Get class link 
    link = terms[term_name]
    
    # Get all departments in this term
    for dept, name in all_depts[term_name].items():
        # Get all classes in this department
        for class_ in get_classes_by_dept(dept, link, year, term):
            print(class_)
            class_.store()
            
        # Sleep to be nice to their website
        time.sleep(1)