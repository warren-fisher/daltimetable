from sqlalchemy import create_engine, MetaData
from sqlalchemy.sql import select, text
from sqlalchemy.ext.automap import automap_base

from cred_mysql import credentials

Base = automap_base()

engine = create_engine(
    f"mysql+pymysql://{credentials['username']}:{credentials['password']}@localhost/daltimetable",
     echo=True)

Base.prepare(engine, reflect=True)

classInfo = Base.classes.classInfo
department = Base.classes.department
labInfo = Base.classes.labInfo

def class_helper(res):
    return {
            'crn': res[0],
            'name': res[1],
            'department': res[2],
            'dates': res[3],
            'start_time': res[4].strftime('%H%M'),
            'end_time': res[5].strftime('%H%M')
        }

def crn_query(crn):
    s = select([classInfo]).where(classInfo.C_CRN == crn)
    result = engine.connect().execute(s)
    for res in result:
        print(res)
        d = class_helper(res)
        return d

def timedelta_helper(t):
    hours = t.seconds//3600
    minutes = (t.seconds-hours*3600)//60
    return f"{hours}:{minutes}"

def name_query(search):
    """
    Raw SQL query for if trying to match a string
    """
    search = '%' + search + '%'
    s = text("""SELECT C_CRN, C_NAME, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
             C_CREDIT_HRS FROM classInfo WHERE C_NAME LIKE :x""")
    result = engine.connect().execute(s, x=search)
    return raw_query_helper(result)

def time_query(start_time, end_time):
    """
    Raw SQL query for if trying to match only a start and end time
    """
    start_time = time_helper(start_time)
    end_time = time_helper(end_time)

    s = text("""SELECT C_CRN, C_NAME, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
             C_CREDIT_HRS FROM classInfo WHERE C_TIMESTART > :x AND C_TIMEEND < :y""")
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

    s = text("""SELECT C_CRN, C_NAME, D_CODE, C_DAYS, C_TIMESTART, C_TIMEEND,
            C_CREDIT_HRS FROM classInfo WHERE C_TIMESTART > :x AND C_TIMEEND < :y AND C_NAME LIKE :z""")
    result = engine.connect().execute(s, x=start_time, y=end_time, z=search)
    return raw_query_helper(result)

def time_helper(time):
    """
    Helper function to format time in the form of HH:MM:SS for MySQL raw query.
    Expects a user input of HH, H or HHMM
    """
    size = len(time)
    if size == 2:
        return time + ":00:00"
    if size == 1:
        return "0" + time + ":00:00"
    if size == 4:
        return time[0:1] + ":" + time[2:3] + ":00"
    return None

def raw_query_helper(results):
    data = {}
    for res in results:
        print(res)
        d = {
            'crn': res[0],
            'name': res[1],
            'department': res[2],
            'dates': res[3],
            'start_time': timedelta_helper(res[4]),
            'end_time': timedelta_helper(res[5])
        }
        data[d['name']] = d
    return data

if __name__ == "__main__":
    name_query("Database")
