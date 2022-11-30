from math import ceil
from flask import Flask, render_template, request, flash
import psycopg2
from config import configpsql, configflask

app = Flask(__name__)
app.config['SECRET_KEY'] = configflask()["secret_key"]


def print_psycopg2_exception(err):
    flash("pgerror: Integrity Violation", "error")
    print("pgerror:", err.pgerror)
    print("pgcode:", err.pgcode, "\n")


def connect():
    try:
        # read connection parameters
        params = configpsql()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        return psycopg2.connect(**params)
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


# I am aware that this is bad practice, however because of the way postgres handles escaped characters I was not able
# to come up with a more safe solution in a reasonable amount of time.
def query_builder(table, form):
    print("table: " + table)
    print("form: " + str(form))
    values = ', '.join('\'' + item + '\'' for item in form.values())
    return "INSERT INTO " + table + " VALUES (" + values + ")"


@app.route('/')
def index():  # put application's code here
    with connect() as con:
        cur = con.cursor()
        cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE'")
        tables=cur.fetchall()
        cur.execute("SELECT e.eid, e.firstname, p.prescriptionName, o.boh, ops.dateOperated FROM Employee as e INNER JOIN Operates as ops ON e.eid = ops.eid INNER JOIN Operations as o ON ops.upcOp = o.upcop INNER JOIN PrescriptionOperations as pops ON o.upcop= pops.upcop INNER JOIN Prescriptions as p ON pops.upcop = p.upcp WHERE e.pos = 'Pharmacy Manager' AND o.boh >=3 AND ops.dateOperated > '03-01-22 00:00:00' ORDER BY ops.dateOperated")
        q1h = [desc[0] for desc in cur.description]
        q1=cur.fetchall()
        cur.execute("SELECT o.otcID, o.otcName, op.boh, op.shelfCap FROM Operations as op INNER JOIN OTC as o ON op.upcOp = o.upco WHERE op.boh > 3 AND op.shelfCap = 3 ORDER BY o.otcID")
        q2h = [desc[0] for desc in cur.description]
        q2 = cur.fetchall()
        cur.execute("select employee.firstname, employee.lastname, drawerverif.overshort, verifysdrawer.dateverifieddrawer from employee join verifysdrawer on employee.eid = verifysdrawer.eid join drawerverif on drawerverif.verifid = verifysdrawer.verifid where overshort > '10' and extract(month from dateverifieddrawer) > '03' order by overshort desc")
        q3h = [desc[0] for desc in cur.description]
        q3 = cur.fetchall()
        cur.execute("SELECT COUNT(*) as prescriptionsCount, (SELECT COUNT(*) as otcCount FROM OTC as o INNER JOIN OTCPrice as oP ON o.upco=oP.upco INNER JOIN Price as p ON OP.upco = p.upc WHERE p.retailP > 15 AND oP.dateUpdated BETWEEN '01-03-2022 00:00:00' AND '11-14-2022 00:00:00'), (SELECT COUNT(*) as nonOTCCount FROM NonOTC as n INNER JOIN NonOTCPrice as nP ON n.upcN= nP.upcN INNER JOIN Price as p ON nP.upcN = p.upc WHERE p.retailP > 5 AND nP.dateUpdated BETWEEN '01-03-2022 00:00:00' AND '11-14-2022 00:00:00') FROM Prescriptions as pr INNER JOIN PrescriptionPrice as prP ON pr.upcP = prP.upcP INNER JOIN Price as p ON prP.upcP = p.upc WHERE p.retailP > 150 AND prP.dateUpdated BETWEEN '01-03-2022 00:00:00' AND '11-14-2022 00:00:00'")
        q4h = [desc[0] for desc in cur.description]
        q4 = cur.fetchall()
    return render_template("index.html", tables=tables, q1h=q1h, q1=q1, q2h=q2h, q2=q2, q3h=q3h, q3=q3, q4h=q4h, q4=q4)


@app.route("/report/<table>/<page>/<sortby>/<order>", methods=["POST", "GET"])
def report(table, page, sortby, order):
    if request.method == "POST":
        result = request.form.to_dict(flat=True)
        query = query_builder(table, result)
        with connect() as con:
            try:
                cur = con.cursor()
                cur.execute(query)
            except Exception as err:
                print_psycopg2_exception(err)
            else:
                flash("Success!")
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
