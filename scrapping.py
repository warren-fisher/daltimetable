import requests as reqs
import re
import sys




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

matcher = re.compile("""<b>([A-Z]{4} (\d*[^<]*))|(
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
# 2 = match class name (needs to change)
# 3 = match second regex
# 4 = match if its a lab, tutorial, or class
# 5 = notes (sometimes a link to JS popup)
# 6 = CRN
# 7 = class number (01, T01, B01)
# 8 = link column (for what???)
# 9 = credit hours
# 10 = ?
# 11 = if monday
# 12 = if tuesday
# 13 = if wednesday
# 14 = if thursday
# 15 = if friday
# 16 = start time
# 17 = end time

def time_setup(match, class_name):
    """
    Clean the regex up
    
    match = regex matching 
    class_name is the name of the class, or the name of the class the lab belongs to
    """
    cached = {'name':class_name}
    cached['type_'] = decode_type(match.group(4))
    cached['crn'] = match.group(6)
    cached['identifier'] = match.group(7)
    cached['credit_hours'] = match.group(9)
    
    # Groups 11-15 are for the days
    days = ''
    for i in range(11, 16):
        day = clean(match.group(i))
        if day.lower() not in ['m', 't', 'w', 'r', 'f']:
            continue
        days += day 
    cached['days'] =  days
    
    cached['start_time'] = match.group(16)
    cached['end_time'] = match.group(17)
    return cached

class ClassInfo():
    """
    Object to store all the lectures and tutorials/labs that a class has.
    Must be careful because sometimes only certain labs/tutorials are valid with certain lecture times.
    """
    
    def __init__(self, name, lectures, labs=None):
        self.name = name
        self.lectures = lectures
        if labs is not None:
            self.labs = labs
        
    def __str__(self):
        s = f"{self.name}\n"
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
    resp = reqs.get(link)
    # print(resp.text)
    
    classes = []
    cached = {}
    for match in matcher.finditer(resp.text):
        if match.group(1):
            if cached != {}:
                classes.append(ClassInfo(**cached))
                cached = {}
            className = f"CSCI {match.group(2)}"
            cached['name'] = className
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

classes = []
for i in range(0, 5):
    pg_num = 20*i + 1
    link = r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202020&s_crn=&s_subj=CSCI&s_numb=&n=" + f"{pg_num}" + r"&s_district=100"
    print(link)
    results = classes_on_pg(link)
    for c in classes_on_pg(link):
        classes.append(c)    

for class_ in classes:
    print(class_)