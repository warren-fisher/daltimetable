# API documentation

This contains all the code related to the API (and scrapping of class off of the academic timetable)

Running `scrapping.py` will store the class information into a generated file, `database.sql`.
The database SQL definition is contained in `template.sql`, and is inserted into the start of `database.sql` by the scrapping script.

## To start the API

First you must store your database credentials in `cred_mysql.py` as a dictionary named `credentials` with keys `username` and `password`.
It is very important to note that this file is included in the .gitignore so no one accidentally uploads database credentials to git.

Once you have initiated your database using the generated `database.sql` file you may start the API by running `app.py`.
The API is not finalized, however it should be safe to run. It should not be vulnerable to SQL injection due to using SQL Alchemy instead of a
custom designed SQL engine.

## Extra notes

`dalonline_display_schedule.html` is used to extract the departments using regex for the scrapping script.
Ideally this could be better automated, however their is no direct link to the list of all departments on the academic timetable.
Perhaps it is possible to automate this with selenium, however I have not looked into it.