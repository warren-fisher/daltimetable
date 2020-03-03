from sqlalchemy import create_engine, MetaData
from sqlalchemy.sql import select
from sqlalchemy.ext.automap import automap_base

from cred_mysql import credentials

Base = automap_base()

engine = create_engine(
    f"mysql+pymysql://{credentials['username']}:{credentials['password']}@localhost/daltimetable",
     echo=True)

Base.prepare(engine, reflect=True)

#TODO: Fix classes table since it doesnt have primary key, maybe put it into classInfo table?
# classes = Base.classes.classes
classInfo = Base.classes.classInfo
department = Base.classes.department
labInfo = Base.classes.labInfo

def crn_query(crn):
    s = select([classInfo]).where(classInfo.C_CRN == crn)
    result = engine.connect().execute(s)
    for res in result:
        d = {
            'crn': res[0],
            'department': res[1],
            'dates': res[2],
        }
        return d

# for class_ in Base.classes:
#     print(class_)