from flask import Flask, jsonify
from sql import crn_query


app = Flask(__name__)

@app.route('/')
def index():
    return "hello"

@app.route('/api/crn/<int:crn>', methods=["GET"])
def get_crn(crn):
    result = crn_query(crn)
    return jsonify(result)

@app.route('/api/test/<int:crn>', methods=["GET"])
def fake_data(crn):
    data = {
        'crn': 2000,
        'name': 'test'
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
