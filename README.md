# The FVS ICS

FVS ICS is an inventory control system designed to efficiently model day to day operations of FVS Pharmacy stores.<br>
Before the ICS, all FVS Pharmacys had inefficient database structures that do not properly model the operations of the store.<br>
It is the purpose of this database system to provide an efficient, fast, and practical model for individual FVS Pharamcys.

**Visit A Section**

- [The Structure of the ICS](#The-Structure-of-the-ICS)
- [Platforms](#Platforms)
- [Contributors](#Contributors)
- [How To Run](#How-To-Run)

## The Structure of the ICS

Attached is the ER Diagram for our ICS

![](images/FVS_Pharmacy_Diagram.png?raw=true)

## Platforms

**PostgreSQL**

The primary language used to create the database is **[PostgreSQL](https://www.postgresql.org/)**<br>
PostgreSQL is an open-source relational database management system that supports both SQL and JSON querying.<br>
Below is is snippet on how to create a table with PostgreSQL

```SQL
create table Employee (
eID serial PRIMARY KEY,
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL,
address VARCHAR (50) UNIQUE NOT NULL,
ssn INT UNIQUE NOT NULL,
pos VARCHAR (50) NOT NULL,
salary INT NOT NULL,
status BOOLEAN NOT NULL
);
```

**pgAdmin 4**

The management tool used for the database is **[pgAdmin](https://www.pgadmin.org/)**<br>
pgAdmin 4 is a graphical user interface (GUI) management tool for postgreSQL databases.<br>
Below is a snippet of what the pgAdmin dashboard looks like 

![](images/pgAdmin.png?raw=true)

## How To Run

Below are instructions on how to run the web ui:

1. Clone the project using command 
```bash 
git clone https://github.com/selfejji/Fake-Value-Store-Inventory-Control-System.git
```

2. Navigate into the flask folder in the project folder<br>

3. Run command to install all the libraries used by this project
```bash
pip install -r requirements.txt
```
 
4. Create a file: database.ini and put the following in it:
```bash
[postgresql]
host=localhost
database=DATABASE_NAME
user=USER_NAME
password=YOUR_PASSWORD
```

5. Create a file: flask.ini and put the following in it:
```bash
[flask]
secret_key=PUT_RANDOM_KEY_HERE
```

6. Run development server by using command 
```bash
python app.py
```
7. Copy the address flask says it is running on and paste into your browser.


## Contributors

Below are the developers of this database:

**[Sammy Elfejji](https://www.github.com/selfejji/)**, selfejji2@student.gsu.edu<br>
Samuel Cooney, scooney2@student.gsu.edu<br>
Yared Geremew, ygeremew1@student.gsu.edu<br>
Jamil Morris, Jmorris104@student.Gsu.edu
