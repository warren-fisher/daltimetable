from flask import Flask, jsonify
from flask_cors import CORS
import sql

app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": ["http://localhost:3000", "https://test.warrenfisher.net", "https://timetable.warrenfisher.net"]}})

@app.route('/api/get/crn/<int:crn>/<int:term>', methods=["GET"])
def get_crn(crn, term):
    """
    Get the course information for a single class.

    Args:
        crn (int): the course registration number, eg. 30561
        term (int): the term code, eg. 7

    Returns:
        string: JSON object representing this class
    """
    result = sql.crn_query(crn, term)
    return jsonify(result)

@app.route('/api/get/master/search=<string:name>&days=<string:days>&start=<string:starttime>&end=<string:endtime>&term=<string:term_code>')
def get_master_search(name, days, starttime, endtime, term_code):
    """
    Get all the classes which match the parameters.

    Args:
        name (string): search for this course name, department, department acronym or CRN
        days (string): the days the class is on, eg. MWTF
        starttime (string): represents the earliest time allowed. Either in HH or HHMM. 24 hours time
        endtime (string): represents the lastest time allowed. Either in HH or HHMM. 24 hours time
        term_code (int): the term code this is in

    Returns:
        string: JSON object mapping the CRN to its course information.
    """
    result = sql.master_query(name, days, starttime, endtime, term_code)
    return jsonify(result)

@app.route('/api/get/terms')
def get_terms():
    """
    Get the currently available terms.

    Returns:
        string: JSON mapping term codes to the term name
    """
    result = sql.get_terms()
    return jsonify(result)

@app.route('/api/get/crns/<int:term>/<string:crns>', methods=["GET"])
def get_multiple_crns(term, crns):
    """
    Get all the class information from the CRNs provided for that term.
    
    TODO: the crns should be an integer

    Args:
        term (int): term code of this term
        crns (string): a string of concatonated CRNs, where each is a 5 digit integer

    Returns:
        string: JSON mapping the CRN to an object with its data.
    """
    result = sql.multiple_crn_query(crns, term)
    return jsonify(result)

@app.route('/api/get/allclasses', methods=["GET"])
def get_all_classes():
    """
    Get all the class data

    Returns:
        string: JSON mapping keys with [term_code]-[CRN] to that course's data
    """
    result = sql.get_all_crn()
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
