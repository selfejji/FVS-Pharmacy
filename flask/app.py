from flask import Flask, render_template, request
import psycopg2
from config import config

app = Flask(__name__)


def connect():
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        return psycopg2.connect(**params)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


@app.route('/')
def hello_world():  # put application's code here
    with connect() as con:
        cur = con.cursor()
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE'")
    return render_template("index.html", data=cur.fetchall())


@app.route("/report/<table>", methods=["POST", "GET"])
def report(table):
    with connect() as con:
        cur = con.cursor()
        cur.execute("SELECT * FROM %s" % table)
        data = cur.fetchall()
        cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = %s ORDER BY ordinal_position ", (table,))
        headers = cur.fetchall()
        print(data)
        print(headers)
    return render_template("report.html", data=data, headers=headers)


if __name__ == '__main__':
    app.run()
