import requests as reqs
from bs4 import BeautifulSoup

link = r"https://dalonline.dal.ca/PROD/fysktime.P_DisplaySchedule?s_term=202020&s_crn=&s_subj=CSCI&s_numb=&n=1&s_district=100"

re = reqs.get(link)
soup = BeautifulSoup(re.text, 'html.parser')
soup.find_all("table", class_="dataentrytable")
