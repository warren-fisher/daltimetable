import requests as reqs
import re
import sys
import time

def clean(s):
    for l in s:
        if l == '&':
            return ''
        if ord(l) >= ord('A') and ord(l) <= ord('Z'):
            return l
    return ' '
def decode_type(t):
    if t == 'b':
        return 'lab'
    if t == 'l':
        return 'lecture'
    if t == 't':
        return 'tutorial'

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

# Match groups
# 1 = match first regex
# 2 = match department code
# 3 = match class name (needs to change)
# 4 = match second regex
# 5 = match if its a lab, tutorial, or class
# 6 = notes (sometimes a link to JS popup)
# 7 = CRN
# 8 = class number (01, T01, B01)
# 9 = link column (for what???)
# 10 = credit hours
# 11 = ?
# 12 = if monday
# 13 = if tuesday
# 14 = if wednesday
# 15 = if thursday
# 16 = if friday
# 17 = start time
# 18 = end time

def time_setup(match, class_name):
    """
    Clean the regex up
    
    match = regex matching 
    class_name is the name of the class, or the name of the class the lab belongs to
    """
    cached = {'name':class_name}
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
    
    def __init__(self, name, lectures, department, labs=None):
        self.name = name
        self.lectures = lectures
        self.department = department
        if labs is not None:
            self.labs = labs
        
    def __str__(self):
        s = f"{self.department} {self.name}\n"
        for class_ in self.lectures:
            s += str(class_) + "\n"
        for lab in self.labs:
            s += str(lab) + "\n"
        return s

class Timeslot():

    def __init__(self, name, type_, crn, identifier, credit_hours, days, start_time, end_time):
            self.name = name
            self.type_ = type_
            self.crn = crn
            self.identifier = identifier
            self.credit_hours = credit_hours
            self.days = days
            self.start_time = start_time
            self.end_time = end_time

    def __str__(self):
        return f"{self.name=} {self.identifier=} {self.type_=} {self.crn=} {self.days=} {self.start_time=}-{self.end_time=} {self.credit_hours=}"


class LabInfo(Timeslot):
    """
    Class to represent a lab or tutorial. They can be treated exactly the same except when displaying their information.
    #TODO: Possible to have a class and a lab ? CSCI 1107 example
    """
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class LectureInfo(Timeslot):
    """
    Class to represent a lecture timeslot. Contains information about its labs/tutorials (if it has any)
    """
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    

def classes_on_pg(link):
    #TODO: Remove any classes that are work terms (IE thesis, internship, coop, research project)

    resp = reqs.get(link)    
    classes = []
    cached = {}
    for match in matcher.finditer(resp.text):
        if match.group(1):
            if cached != {}:
                classes.append(ClassInfo(**cached))
                cached = {}
            cached['department'] = match.group(2)
            cached['name'] = match.group(3)
            cached['labs'] = []
            cached['lectures'] = []
        else:
            if decode_type(match.group(4)) != 'lecture':
                lab = LabInfo(**time_setup(match, cached['name']))
                cached['labs'].append(lab)
            else:
                lecture = LectureInfo(**time_setup(match, cached['name']))
                cached['lectures'].append(lecture)
    return classes

def get_classes_by_dept(department):
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
    
    text = open("dalonline_display_schedule.html", 'r').read()
    dept_matcher = re.compile("""<a href="fysktime\.P_DisplaySchedule\?s_term=202020&s_subj=([A-Za-z]{4})&s_district=100">(.*)</a>""")
    depts = {}
    for match in dept_matcher.finditer(text):
        depts[match.group(1)]=match.group(2)
        
    return depts

for dept in get_all_dept().keys():
    for class_ in get_classes_by_dept(dept):
        print(class_)
    time.sleep(5)