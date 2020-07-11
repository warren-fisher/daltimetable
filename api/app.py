from flask import Flask, jsonify
from flask_cors import CORS
import sql


#TODO: standardize API, simplify and slim down to base neccesary endpoints
app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})

@app.route('/')
def index():
    return "hello"

@app.route('/api/crn/<int:crn>/<int:term>', methods=["GET"])
def get_crn(crn, term):
    result = sql.crn_query(crn, term)
    return jsonify(result)

@app.route('/api/search/<string:search>', methods=["GET"])
def get_search(search):
    result = sql.name_query(search)
    return jsonify(result)

@app.route('/api/time/<string:timestart>/<string:timeend>')
def get_time(timestart, timeend):
    result = sql.time_query(timestart, timeend)
    return jsonify(result)

@app.route('/api/search_time/<string:search>/<string:timestart>/<string:timeend>')
def get_time_and_search(search, timestart, timeend):
    result = sql.time_and_search_query(search, timestart, timeend)
    return jsonify(result)

@app.route('/api/get/master/<string:name>/<string:crn>/<string:dept>/<string:days>/<string:starttime>/<string:endtime>/<string:term_code>')
def get_master_search(name, crn, dept, days, starttime, endtime, term_code):
    result = sql.master_query(name, crn, dept, days, starttime, endtime, term_code)
    return jsonify(result)

@app.route('/api/get/terms')
def get_terms():
    result = sql.get_terms()
    return jsonify(result)

@app.route('/api/get/crns/<int:term>/<string:crns>', methods=["GET"])
def get_multiple_crns(term, crns):
    result = sql.multiple_crn_query(crns, term)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
