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
<td CLASS="dett(.)"NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP><p class="centeraligntext">(.*)</p></td>
<td CLASS="dett."NOWRAP>.*?(\d*)-(\d*)</td>)""", re.MULTILINE)

output = open('results', 'w')
for match in matcher.finditer(resp.text):
    if match.group(1):
        string = 'CSCI {}'.format(match.group(2))
    else:
        string = ('{},{},{},{},{},{},{}-{}'.format(decode_type(match.group(4)),
                                            clean(match.group(5)),
                                            clean(match.group(6)),
                                            clean(match.group(7)),
                                            clean(match.group(8)),
                                            clean(match.group(9)),
                                            match.group(10),
                                            match.group(11)
                                                    ))
    print(string)
    print(string, file=output)
output.close()
