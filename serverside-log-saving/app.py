import os
import json
import csv

from flask import Flask, escape, url_for,render_template, g, request, redirect, jsonify, session
from werkzeug import secure_filename

from pathlib import Path

app = Flask(__name__)

ROOT = Path(os.path.dirname(__file__))

LOGS = ROOT / "logs"

@app.route('/')
def game():
    return render_template('landing.html')

@app.route('/logs/<prolificid>/big5', methods=["POST"])
def save_big5_log(prolificid):

    print("Got Big5 logs!")

    params = request.get_json(force=True)

    with open(LOGS / f"{prolificid}_big5.csv", "w") as f:
        f.write(",".join(["\"%s\"" % params["browser"]] + [str(i) for i in params["big5"]]))

    return ""

@app.route('/logs/<prolificid>/gamedata', methods=["POST"])
def save_gamedata_log(prolificid):

    print("Got gamedata logs!")

    params = request.get_json(force=True)
    print(params)

    file = LOGS / f"{prolificid}_gamedata.csv"

    # first access: create the CSV columns names
    if not file.exists():
        with open(file, "w") as f:
            writer = csv.DictWriter(f, fieldnames=params["gamedata"].keys())
            writer.writeheader()
            writer.writerow(params["gamedata"])
    else:
        with open(file, "a+") as f:
            writer = csv.DictWriter(f, fieldnames=params["gamedata"].keys())
            writer.writerow(params["gamedata"])

    return ""



