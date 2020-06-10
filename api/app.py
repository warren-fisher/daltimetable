from flask import Flask, jsonify
from flask_cors import CORS
import sql


app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})

@app.route('/')
def index():
    return "hello"

@app.route('/api/crn/<int:crn>', methods=["GET"])
def get_crn(crn):
    result = sql.crn_query(crn)
    return jsonify(result)

@app.route('/api/search/<string:search>', methods=["GET"])
def get_search(search):
    result = sql.name_query(search)
    return jsonify(result)

@app.route('/api/time/<int:timestart>/<int:timeend>')
def get_time(timestart, timeend):
    result = sql.time_query(timestart, timeend)
    return jsonify(result)

@app.route('/api/search_time/<string:search>/<string:timestart>/<string:timeend>')
def get_time_and_search(search, timestart, timeend):
    result = sql.time_and_search_query(search, timestart, timeend)
    return jsonify(result)

@app.route('/api/get/master/<string:name>/<string:crn>/<string:dept>/<string:days>/<string:starttime>/<string:endtime>/<int:year>/<string:term>')
def get_master_search(name, crn, dept, days, starttime, endtime, year, term):
    result = sql.master_query(name, crn, dept, days, starttime, endtime, year, term)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
