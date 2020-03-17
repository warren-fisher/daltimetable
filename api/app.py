from flask import Flask, jsonify
from flask_cors import CORS
from sql import crn_query, name_query


app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})

@app.route('/')
def index():
    return "hello"

@app.route('/api/crn/<int:crn>', methods=["GET"])
def get_crn(crn):
    result = crn_query(crn)
    return jsonify(result)

@app.route('/api/search/<string:search>', methods=["GET"])
def get_search(search):
    result = name_query(search)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
