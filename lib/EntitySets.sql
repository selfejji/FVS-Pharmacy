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

create table DrawerVerif (
reg INT PRIMARY KEY,
currAmount INT NOT NULL,
enteredAmount INT NOT NULL,
overShort INT NOT NULL
);

create table Deposit (
depID serial PRIMARY KEY,
dateDeposited DATE NOT NULL DEFAULT CURRENT_DATE,
amount INT NOT NULL
);

create table DCR (
dcrID serial PRIMARY KEY,
sales INT NOT NULL,
datePosted DATE NOT NULL DEFAULT CURRENT_DATE,
posted BOOLEAN NOT NULL
);

create table ImpresVerif (
impID serial PRIMARY KEY,
count INT NOT NULL,
ones INT NOT NULL,
fives INT NOT NULL,
tens INT NOT NULL,
twenties INT NOT NULL,
fifties INT NOT NULL,
hundreds INT NOT NULL,
pennies INT NOT NULL,
nickels INT NOT NULL,
dimes INT NOT NULL,
quarters INT NOT NULL
);

create table PriceMUMD (
mumdID serial PRIMARY KEY,
retailPrice INT NOT NULL,
salePrice INT NOT NULL,
mumd INT NOT NULL,
dateEdited DATE NOT NULL DEFAULT CURRENT_DATE
);

create table NonOTC (
item INT NOT NULL,
upc INT NOT NULL,
name VARCHAR (50) NOT NULL
nonOTCID INT PRIMARY KEY
);

create table OTC (
otcID Char(10) PRIMARY KEY,
item INT NOT NULL,
upc INT NOT NULL,
name VARCHAR (50) NOT NULL
);

create table Operations (
opID serial PRIMARY KEY,
dateEdited DATE NOT NULL DEFAULT CURRENT_DATE,
boh INT NOT NULL,
shelfCap INT NOT NULL,
cycleCount INT NOT NULL
);

create table Prescriptions (
prescrID INT PRIMARY KEY,
name VARCHAR (100) NOT NULL,
pantientName VARCHAR (50) NOT NULL,
price INT NOT NULL,
dateSold DATE NOT NULL DEFAULT CURRENT_DATE
);



