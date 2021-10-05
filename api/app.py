from flask import Flask, jsonify
from flask_cors import CORS
import sql


#TODO: standardize API, simplify and slim down to base neccesary endpoints
app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": ["http://localhost:3000", "https://test.warrenfisher.net", "https://timetable.warrenfisher.net"]}})



# TODO: make all things /api/v1/get or whatever to standardize
@app.route('/api/crn/<int:crn>/<int:term>', methods=["GET"])
def get_crn(crn, term):
    result = sql.crn_query(crn, term)
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

@app.route('/api/get/allclasses', methods=["GET"])
def get_all_classes():
    result = sql.get_all_crn()
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
