import requests as reqs
import re
import sys

link = r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202020&s_crn=&s_subj=CSCI&s_numb=&n=1&s_district=100"

resp = reqs.get(link)

def clean(s):
    for l in s:
        if l == '&':
            return ' '
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
# 8 = credit hours
# 9 = link column (not sure to what)
# 10 = if monday
# 11 = if tuesday
# 12 = if wednesday
# 13 = if thursday
# 14 = if friday
# 15 = start time
# 16 = end time


class ClassInfo():
    """
    Object to store all the lectures and tutorials/labs that a class has.
    Must be careful because sometimes only certain labs/tutorials are valid with certain lecture times.
    """
    
    def __init__():
        pass


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
        return f"{self.name} {self.type_} {self.crn} {self.days} {self.start_time}-{self.end_time}"

class LabInfo(Timeslot):
    """
    Class to represent a lab or tutorial. They can be treated exactly the same except when displaying their information.
    """
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class LectureInfo(Timeslot):
    """
    Class to represent a lecture timeslot. Contains information about its labs/tutorials (if it has any)
    """
    
    def __init__(self, labs, **kwargs):
        super().__init__(**kwargs)
        self.labs = labs
    
    def __str__(self):
        print(super().__str__())
        for lab in self.labs:
            print(lab)

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
    cached['credit_hours'] = match.group(8)
    cached['days'] = f"{clean(match.group(10))}{clean(match.group(11))}{clean(match.group(12))}\
    {clean(match.group(13))}{clean(match.group(14))}"
    cached['start_time'] = match.group(15)
    cached['end_time'] = match.group(16)
    return cached


#TODO: Multiple lectures
classes = []
cached = {}
for match in matcher.finditer(resp.text):
    if match.group(1):
        if cached != {}:
            classes.append(LectureInfo(**cached))
            cached = {}
        className = f"CSCI {match.group(2)}"
        cached['name'] = className
        cached['labs'] = []
    else:
        if decode_type(match.group(4)) != 'lecture':
            lab = LabInfo(**time_setup(match, cached['name']))
            cached['labs'].append(lab)
        else:
            # print(cached['labs'])
            lecture = time_setup(match, cached['name'])
            cached = {**lecture, **cached}

for class_ in classes:
    print(class_)