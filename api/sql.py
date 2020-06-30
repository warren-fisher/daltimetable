from sqlalchemy import create_engine, MetaData
from sqlalchemy.sql import select, text
from sqlalchemy.ext.automap import automap_base

from cred_mysql import credentials

engine = create_engine(
    f"mysql+pymysql://{credentials['username']}:{credentials['password']}@localhost/daltimetable",
     echo=True)

def class_helper(res):
    return {
            'crn': res[0],
            'year': res[1],
            'term': res[2],
            'name': res[3],
            'code': res[4],
            'department': res[5],
            'dates': res[6],
            'start_time': res[7].strftime('%H%M'),
            'end_time': res[8].strftime('%H%M')
        }

#TODO: should be able to specify term
def crn_query(crn):
    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_CRN LIKE :x""")

    result = engine.connect().execute(s, x=crn)

    return raw_query_helper (result)

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
    print(f"{start_time=} {end_time=}")

    s = text("""SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE C_TIMESTART > :x AND C_TIMEEND < :y AND C_NAME LIKE :z""")
    result = engine.connect().execute(s, x=start_time, y=end_time, z=search)
    return raw_query_helper(result)

convert = {'S': 'Summer',
           'F': 'Fall',
           'W': 'Winter'}


def master_query(name, crn, dept, days, start, end, year, term):
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
    if term == '!':
        term = '%'
    if year == '!':
        year = '%'

    # Set search parameters
    name_search = '%' + name + '%'
    start_time = time_helper(start)
    end_time = time_helper(end)
    crn_search = '%' + crn + '%'
    dept_search = '%' + dept + '%'
    days_query, matches = permute_days(days)

    sql_text = """SELECT C_CRN, C_NAME, C_CODE, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS, YR, TERM FROM classInfo JOIN department USING(D_CODE)
            JOIN terms USING(T_CODE) WHERE
            C_NAME LIKE :a AND C_CRN LIKE :b AND (D_CODE LIKE :c OR D_NAME LIKE :c) AND C_TIMESTART > :d AND C_TIMEEND < :e
            AND YR LIKE :f AND TERM LIKE :g """ + days_query
    s = text(sql_text)

    result = engine.connect().execute(s, a=name_search, b=crn_search, c=dept_search, d=start_time,
                                      e=end_time, f=year, g=term, **matches)
    return raw_query_helper(result)

def permute_days(days):
    """
    Helper function to return a raw SQL string matching possible day combinations.
    The SQL matches anything that only contains the specified days.
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

    i = 0
    for day in possible_days:
        if day not in desired_days:
            day_search = '%' + day + '%'
            matches[variables_to_use[i]] = day_search
            if i != 0:
                s += f" OR {sql} :{variables_to_use[i]}"
            else:
                s += f"{sql} :{variables_to_use[i]}"
            i += 1
    s += ")"

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

def raw_query_helper(results):
    data = {}
    for res in results:
        print(res)
        d = {
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
        data[d['name']] = d
    return data

if __name__ == "__main__":
    s = master_query('hi', 2, "", "MWF", '9', '11')
    print(s)
