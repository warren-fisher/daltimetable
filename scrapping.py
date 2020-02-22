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

# matcher = re.compile("""<b>([A-Z]{4} (\d*[^<]*))|(
# <td CLASS="dett(.)"NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
# <td CLASS="dett."NOWRAP>.*?(\d*)-(\d*)</td>)""", re.MULTILINE)



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


classes = []
cached = {}
for match in matcher.finditer(resp.text):
    if match.group(1):
        if cached != {}:
            classes.append(ClassInfo(**cached))
            cached = {}
        className = f"CSCI {match.group(2)}"
        cached['name'] = className
    else:
        cached['type_'] = decode_type(match.group(4))
        cached['crn'] = match.group(6)
        cached['identifier'] = match.group(7)
        cached['credit_hours'] = match.group(8)
        cached['days'] = f"{clean(match.group(10))}{clean(match.group(11))}{clean(match.group(12))}\
        {clean(match.group(13))}{clean(match.group(14))}"
        cached['start_time'] = match.group(15)
        cached['end_time'] = match.group(16)

for class_ in classes:
    print(class_)

# output = open('results', 'w')
# for match in matcher.finditer(resp.text):
#     print(f"{match.group(1)=} {match.group(2)=} {match.group(3)=}")
#     print(f"{match.group(4)=} {match.group(5)=} {match.group(6)=}")
#     print(f"{match.group(7)=} {match.group(8)=} {match.group(9)=}")
#     print(f"{match.group(10)=} {match.group(11)=}")
#     break
#     if match.group(1):
#         string = 'CSCI {}'.format(match.group(2))
#     else:
#         string = ('{},{},{},{},{},{},{}-{}'.format(decode_type(match.group(4)),
#                                             clean(match.group(5)),
#                                             clean(match.group(6)),
#                                             clean(match.group(7)),
#                                             clean(match.group(8)),
#                                             clean(match.group(9)),
#                                             match.group(10),
#                                             match.group(11)
#                                                     ))
#     print(string)
#     print(string, file=output)
# output.close()
