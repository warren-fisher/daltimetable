import requests as reqs
import re
import sys
import time

#TODO: classroom location data (building/campus)
#TODO: professor data (link with rate my teacher?)
#TODO: class size/spots open/waitlist spots open/waitlist size

def clean(s):
    """
    Remove unnecesary junk from match eg. &agb&adfadsf that means nothing
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
    return s.replace("'", "\\'")            


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
<td CLASS="dett."NOWRAP>.*?(\d*)-(\d*)</td>)""", re.MULTILINE)

#TODO: better matcher
# matcher = re.compile("""<b>(([A-Z]{4}) (\d*[^<]*))|(
# <td CLASS="dett(.)">(.*)</td>
# <td CLASS="dett."><b>(.*)</b></td>
# <td CLASS="dett.">(.*)</td>
# <td CLASS="dett.">(.*)</td>
# <td CLASS="dett.">(.*)</td>
# <td CLASS="dett.">(.*)</td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP>.*?(\d*)-(\d*)</td>)
# <td CLASS="dett."NOWRAP>.*<br />(.*)</td>
# <td CLASS="dett."NOWRAP><p class="rightaligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="rightaligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="rightaligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="rightaligntext">(.*)</p></td>""", re.MULTILINE)


#TODO: parse this for waitlist/class size data
"""
<td class="dettl" nowrap=""><p class="rightaligntext">OPEN (55)<br> CSCI  (45)<br> APCS  (10)</p></td>
<td class="dettl" nowrap=""><p class="rightaligntext">54<br>51<br>8</p></td>
<td class="dettl" nowrap=""><p class="rightaligntext">1<br>-6<br>2</p></td>
"""

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
# 17 = start time
# 18 = end time

#TODO: these
# 19 = location
# 20 = class size(need to parse)
# 21 = number registered
# 22 = spaces left

def time_setup(match, class_name, department):
    """
    Clean the regex up

    match = regex matching 
    class_name is the name of the class, or the name of the class the lab belongs to
    """
    cached = {'name':class_name, 'department':department}
    cached['type_'] = decode_type(match.group(5))
    cached['crn'] = match.group(7)
    cached['identifier'] = match.group(8)
    cached['credit_hours'] = match.group(10)

    # Groups 12-16 are for the days
    days = ''
    for i in range(12, 17):
        day = clean(match.group(i))
        if day.lower() not in ['m', 't', 'w', 'r', 'f']:
            continue
        days += day 
    cached['days'] =  days

    cached['start_time'] = match.group(17)
    cached['end_time'] = match.group(18)
    return cached

class ClassInfo():
    """
    Object to store all the lectures and tutorials/labs that a class has.
    Must be careful because sometimes only certain labs/tutorials are valid with certain lecture times.
    """

    def __init__(self, name, lectures, department, labs=None, tutorials=None):
        self.name = name
        self.lectures = lectures
        self.department = department
        if labs is not None:
            self.labs = labs
        if tutorials is not None:
            self.tutorials = tutorials

    def __str__(self):
        s = f"{self.department} {self.name}\n"
        for class_ in self.lectures:
            s += str(class_) + "\n"
        for lab in self.labs:
            s += str(lab) + "\n"
        return s
    
    def store(self):
        for lecture in self.lectures:
            lecture.store()

            for lab in self.labs:
                lab.store(lecture.crn)
            for tut in self.tutorials:
                tut.store(lecture.crn)

class Timeslot():
    """
    Superclass for storing generic information about anything that may occupy a timeslot
    """

    def __init__(self, name, type_, crn, identifier, credit_hours, days, start_time, end_time, department):
            self.name = escape_sql(name)
            self.type_ = escape_sql(type_)
            self.crn = escape_sql(crn)
            self.identifier = escape_sql(identifier)
            self.credit_hours = escape_sql(credit_hours)
            self.days = escape_sql(days)
            self.start_time = escape_sql(start_time)
            self.end_time = escape_sql(end_time)
            self.department = escape_sql(department)

    def __str__(self):
        return f"{self.name=} {self.identifier=} {self.type_=} {self.crn=} {self.days=} {self.start_time=}-{self.end_time=} {self.credit_hours=}"
    
    @staticmethod
    def time_convert(time):
        return f"TIME(STR_TO_DATE('{time}', '%k%i'))"


class LabInfo(Timeslot):
    """
    Class to represent a lab or tutorial. They can be treated exactly the same except when displaying their information.
    It is perhaps possible for a class to have a lab and a tutorial, but that is fine they can both be the same class.
    """

    def __init__(self, tutorial=None, **kwargs):
        if tutorial != None:
            self.tutorial = tutorial
        else:
            self.tutorial = False
        super().__init__(**kwargs)


    def _sql(self, other_crn):
        if self.tutorial:
            is_tutorial = 1
        else:
            is_tutorial = 0

        sql = f"""\nINSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES ({self.crn}, '{self.days}', {Timeslot.time_convert(self.start_time)},
        {Timeslot.time_convert(self.end_time)}, {is_tutorial}, {other_crn});
        """

        return sql

    def store(self, other_crn):
        with open('database.sql', 'a') as f:
            f.write(self._sql(other_crn))

class LectureInfo(Timeslot):
    """
    Class to represent a lecture timeslot. Contains information about its labs/tutorials (if it has any)
    """
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
    def _sql(self):
        sql = f"""\nINSERT INTO classInfo (C_CRN, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES ({self.crn}, '{self.name}', '{self.department}', '{self.days}', 
        {Timeslot.time_convert(self.start_time)}, {Timeslot.time_convert(self.end_time)}, {self.credit_hours});\n"""

        return sql
        
    def store(self):
        with open('database.sql', 'a') as f:
            f.write(self._sql())
            

def classes_on_pg(link):
    """
    Get all the classes within a page (not including work/study terms)
    """

    resp = reqs.get(link)
    classes = []
    cached = {}
    for match in matcher.finditer(resp.text):

        # Match class name
        if match.group(1):
            if cached != {}:
                # Get rid of any class that is a work/study term (it will have no lec/lab/tut)
                if (len(cached['labs']) + len(cached['tutorials']) + len(cached['lectures'])) == 0:
                    cached = {}
                else:
                    classes.append(ClassInfo(**cached))
                    cached = {}
            cached['department'] = match.group(2)
            cached['name'] = match.group(3)
            cached['labs'] = []
            cached['tutorials'] = []
            cached['lectures'] = []

        # Match lecture/tutorial/lab info
        elif match.group(4):
            if (type_ := decode_type(match.group(5))) != 'lecture':

                # These type of classes dont matter to us
                if type_ in ['workterm', 'study', None]:
                    continue
                if type_ == 'tutorial':
                    lab = LabInfo(True, **time_setup(match, cached['name'], cached['department']))
                else:
                    lab = LabInfo(**time_setup(match, cached['name'], cached['department']))
                cached[type_ + 's'].append(lab)
            else:
                lecture = LectureInfo(**time_setup(match, cached['name'], cached['department']))
                cached['lectures'].append(lecture)
    return classes

def get_classes_by_dept(department):
    """
    Get all the classes (that are not work/study terms) from a specific department
    """
    classes = []
    i = 0
    while True:
        pg_num = 20*i + 1
        link = r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202020&s_crn=&s_subj=" + f"{department}" + r"&s_numb=&n=" + f"{pg_num}" + r"&s_district=100"
        print(link)
        results = classes_on_pg(link)
        if len(results) == 0:
            break
        for c in classes_on_pg(link):
            classes.append(c)
        i += 1
    return classes

def get_all_dept():
    """
    Get all the names and acronyms of the Dalhousie departments (Halifax campus only)
    """
    text = open("dalonline_display_schedule.html", 'r').read()
    dept_matcher = re.compile("""<a href="fysktime\.P_DisplaySchedule\?s_term=202020&s_subj=([A-Za-z]{4})&s_district=100">(.*)</a>""")
    depts = {}
    for match in dept_matcher.finditer(text):
        depts[match.group(1)]=match.group(2)

    return depts

def dept_sql(dept, name):
    """
    Function for writing the department code and name to sql, along with adding a comment
    so that the sql is easier to read.
    """
    s = f'###################### {escape_sql(name)} ######################\n'
    sql = '\n'
    # Subtract one because of adding newline char at end
    sql += '#'*(len(s)-1) + '\n'
    sql += s
    sql += '#'*(len(s)-1) + '\n'
    sql += f"INSERT INTO department VALUES ('{escape_sql(dept)}','{escape_sql(name)}');\n"
    return sql


for dept, name in get_all_dept().items():
    with open('database.sql', 'a') as f:
        f.write(dept_sql(dept, name))
    for class_ in get_classes_by_dept(dept):
        print(class_)
        class_.store()
    time.sleep(5)