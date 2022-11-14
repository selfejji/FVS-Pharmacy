# The FVS ICS

FVS ICS is an inventory control system designed to efficiently model day to day operations of FVS Pharmacy stores.<br>
Before the ICS, all FVS Pharmacys had inefficient database structures that do not properly model the operations of the store.<br>
It is the purpose of this database system to provide an efficient, fast, and practical model for individual FVS Pharamcys.

**Visit A Section**

- [The Structure of the ICS](#The-Structure-of-the-ICS)
- [Platforms](#Platforms)
- [Contributors](#Contributors)

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

## Contributors

Below are the developers of this database:

**[Sammy Elfejji](https://www.github.com/selfejji/)**, selfejji2@student.gsu.edu<br>
Samuel Cooney, scooney2@student.gsu.edu<br>
Yared Geremew, ygeremew1@student.gsu.edu

