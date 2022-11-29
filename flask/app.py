from math import ceil

from flask import Flask, render_template, request
import psycopg2
from config import configpsql, configflask

app = Flask(__name__)
app.config['SECRET_KEY'] = configflask()["secret_key"]


def connect():
    try:
        # read connection parameters
        params = configpsql()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        return psycopg2.connect(**params)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


def query_builder(table, form):
    print("table: " + table)
    print("form: " + str(form))
    values = ', '.join(form.values())
    return "INSERT INTO " + table + " VALUES (" + values + ")"


@app.route('/')
def hello_world():  # put application's code here
    with connect() as con:
        cur = con.cursor()
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE'")
    return render_template("index.html", data=cur.fetchall())


@app.route("/report/<table>/<page>/<sortby>/<order>", methods=["POST", "GET"])
def report(table, page, sortby, order):
    if request.method == "POST":
        try:
            result = request.form.to_dict(flat=True)
            query = query_builder(table, result)
            with connect() as con:
                cur = con.cursor()
                cur.execute(query)
        except Exception as e:
            print(e)
    with connect() as con:
        cur = con.cursor()
        if sortby == 'default':
            cur.execute("SELECT * FROM %s" % table)
        else:
            cur.execute("SELECT * FROM %s ORDER BY %s %s" % (table, sortby, order))
        data = cur.fetchall()
        cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = %s ORDER BY ordinal_position ", (table,))
        headers = cur.fetchall()
        pages = ceil(len(data) / 20)+1
        data = data[(int(page)-1)*20:int(page)*20]
    return render_template("report.html", data=data, headers=headers, pages=pages, page=page, table=table, sortby=sortby, order=order)


if __name__ == '__main__':
    app.run()
