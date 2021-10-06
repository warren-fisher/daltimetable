from sqlalchemy import create_engine, MetaData
from sqlalchemy.sql import select, text
from sqlalchemy.ext.automap import automap_base

from cred_mysql import credentials

engine = create_engine(
    f"mysql+pymysql://{credentials['username']}:{credentials['password']}@localhost/daltimetable",
     echo=True)

# TODO: make it so select statements all use a common SELECT cols string so they 
# neccesarily have to be the same

def crn_query(crn, term):
    """
    Query the database for a specific class in a specific term.
    
    Args:
        crns (int): The course registration number
        term (int): the term code

    Returns:
        dictionary: A dictionary mapping the CRN to it's class data
    
    """
    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_CRN LIKE :x AND T_CODE LIKE :z""")

    # Not possible to get a duplicate since the (CRN, term) pair is unique
    result = engine.connect().execute(s, x=crn, z=term).first()
    if result is None:
        return {}
    else:
        return format_class(result)

def multiple_crn_query(crns, term):
    """
    Query the database for information about multiple CRNs in the same term.
    
    To note, CRNs are always 5 digits and do not lead with a zero.

    Args:
        crns (string): A string containing only digits, where every group of 5 is a CRN to return
        term (int): the term code

    Returns:
        dictionary: A dictionary mapping the CRN to it's class data
    """

    length = len(crns)
    result = {}

    if length % 5 != 0:
        return result
    for i in range(length//5):
        crn = crns[5*i:5*(i+1)]
        # Make sure it is a valid integer
        # Is it neccesary, wont the CRN query just return nothing if it is a string?
        try:
            int(crn)
        except ValueError:
            pass
        data = crn_query(crn, term)
        result[crn] = data

    return result

def timedelta_helper(t):
    hours = t.seconds//3600
    minutes = (t.seconds-hours*3600)//60
    # Formatting is different whether it is 5 min or 10+ min
    if minutes >= 10:
        return f"{hours}:{minutes}"
    else:
        return f"{hours}:0{minutes}"

# TODO: Should match course codes and departments (which are not in the 'name')
def name_query(search):
    """
    Raw SQL query for if trying to match a string
    """
    search = '%' + search + '%'
    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_NAME LIKE :x""")
    result = engine.connect().execute(s, x=search)
    return raw_query_helper(result)

def time_query(start_time, end_time):
    """
    Raw SQL query for if trying to match only a start and end time
    """
    start_time = time_helper(start_time)
    end_time = time_helper(end_time)

    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_TIMESTART > :x AND C_TIMEEND < :y""")
    result = engine.connect().execute(s, x=start_time, y=end_time)
    return raw_query_helper(result)

def time_and_search_query(search, start_time, end_time):
    """
    Raw SQL query for if trying to match a string and a start and end time
    """
    search = '%' + search + '%'
    start_time = time_helper(start_time)
    end_time = time_helper(end_time)

    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_TIMESTART > :x AND C_TIMEEND < :y AND C_NAME LIKE :z""")
    result = engine.connect().execute(s, x=start_time, y=end_time, z=search)
    return raw_query_helper(result)

convert = {'S': 'Summer',
           'F': 'Fall',
           'W': 'Winter'}


def master_query(name, crn, dept, days, start, end, term_code):
    """
    A master raw SQL query for matching by class name, crn, department code or name, the days, semester and classtime.
    """
    # Set default values if a ! is detected
    if name == '!':
        name = ''
    if crn == '!':
        crn = ''
    if dept == '!':
        dept = ''
    if days == '!':
        days = 'MTWRF'
    if start == '!':
        start = '1'
    if end == '!':
        end = '23'
    if term_code == '!':
        term_code = '%'

    # Set search parameters
    name_search = '%' + name + '%'
    start_time = time_helper(start)
    end_time = time_helper(end)
    crn_search = '%' + crn + '%'
    dept_search = '%' + dept + '%'
    
    # Days query and matches will be empty if there are no days
    days_query, matches = permute_days(days)

    sql_text = """SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE
            C_NAME LIKE :a AND C_CRN LIKE :b AND (D_CODE LIKE :c OR D_NAME LIKE :c) AND C_TIMESTART > :d AND C_TIMEEND < :e
            AND T_CODE LIKE :f """ + days_query
    s = text(sql_text)

    # **matches since it is a dictionary of prepared statement letter (eg. q for :q) -> user input (eg 'W')
    result = engine.connect().execute(s, a=name_search, b=crn_search, c=dept_search, d=start_time,
                                      e=end_time, f=term_code, **matches)
    return raw_query_helper(result)

def get_terms():
    sql_text = """SELECT T_CODE, YR, TERM FROM terms"""
    s = text(sql_text)

    result = engine.connect().execute(s)

    all_terms = {}

    for res in result:
        term_code, year, term = res
        all_terms[term_code] = f"{term} {year}"

    return all_terms

def permute_days(days):
    """
    Helper function to return a raw SQL string matching possible day combinations.
    The SQL matches anything that only contains the specified days.
    
    Args:
        days (string): A string representing the days, eg MWTF

    Returns:
        tuple: The SQL string generated and a dictionary of prepared statement letters used.
               The string generated will be empty, or of the format AND NOT (...)
    """

    possible_days = ['M', 'T', 'W', 'R', 'F']
    desired_days = list(days)

    # Variables and the corresponding sql portion to input using SQL alchemy textual sql
    variables_to_use = ['q', 'r', 's', 't', 'u']
    matches = {}

    # Return string
    s = "AND NOT ("

    # Reusable SQL
    sql = 'C_DAYS LIKE'

    # What we do is say user gives us MWF
    # This does not mean they want classes on all of MWF
    # Instead, this means they want classes which only have lectures on M, W, or F
    # So, we can treat this as AND NOT (Tuesday(T) or Thursday(R))
    
    # Index to keep track of which prepared statement letter we can use next
    i = 0
    for day in possible_days:
        if day not in desired_days:
            # Do not allow anything with %F% if the user did not allow Friday
            day_search = '%' + day + '%'
            # Use the prepared statement letter
            matches[variables_to_use[i]] = day_search
            # Not the first, so add an OR
            if i != 0:
                s += f" OR {sql} :{variables_to_use[i]}"
            # First, so no leading OR
            else:
                s += f"{sql} :{variables_to_use[i]}"
            # Increment the prepared statement letter so we do not use it again
            i += 1
    
    # Dont forget to close open bracket
    s += ")"

    # This means we have no SQL generated and should ignore this part
    if s == "AND NOT ()":
        return ('', {})
    return (s, matches)

def time_helper(time):
    """
    Helper function to format time in the form of HH:MM:SS for MySQL raw query.
    Expects a user input of HH, H, HMM or HHMM
    """
    size = len(time)
    if size == 2:
        return time + ":00:00"
    if size == 1:
        return "0" + time + ":00:00"
    if size == 4:
        return time[0:2] + ":" + time[2:4] + ":00"
    if size == 3:
        return "0" + time[0:1] + ":" + time[1:3] + ":00"
    return None

def format_class(res):
    """
    Format the class data in a regular way

    Args:
        res (array): standard SQL column order as indices

    Returns:
        dictionary: contains the neccesary class data
    """
    return {
            'crn': res[0],
            'name': res[1],
            'class_code': res[2],
            'department': res[3],
            'dates': res[4],
            'start_time': timedelta_helper(res[5]),
            'end_time': timedelta_helper(res[6]),
            'year': res[8],
            'term': res[9],
        }

def raw_query_helper(results):
    data = {}
    for res in results:
        d = format_class(res)
        # TODO: d['name'] can have duplicates (even crn could)
        data[d['name']] = d
    return data

def get_all_crn():
    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM, T_CODE FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE)""")
    
    result = engine.connect().execute(s)
    if result is None:
        return {}
    else:

        data = {}
        for res in result:
            d = format_class(res)
            # Each name unique since term-crn pair is unique
            name = f"{res[10]}-{res[0]}"
            data[name] = d
        return data