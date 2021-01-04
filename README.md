# Dalhousie Timetable Helper

I have created a tool to help with picking classes at Dalhousie.
It supports searching / filtering classes. Dalhousie's academic timetable (class list) does not have searching/filtering features.

## Feature support
- Searching by name, course registration number, time and days of the week the course occurs
- Sharing a selection of class(es) with friends via a link

## Planned features
- In share link remove any terms from the term selector if there are no classes in that term
- Ability to remove class from selection (perhaps a list of selected classes)
- Make it look much better
- Improve responsiveness so that it is usable on a wider range of devices
  - Currently it is not very usuable on mobile devices, somewhat usuable on tablets
- Search by location / professor
- Add the ability to compare schedules with your friends in a 'compare' mode

## Bugs to fix
- Class names not fitting properly within class 'box'
- Responsiveness
- Accessibility of the time display table (perhaps not possible)

## Dependencies
### API
- Python 3
- SQL Alchemy, PyMYSQL
- Flask, Flask CORS
- MySQL / MariaDB

### Website
- React
- React router

