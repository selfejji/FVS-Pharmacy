/******Entity Table Creations******/

CREATE TABLE IF NOT EXISTS Employee (
   eID serial PRIMARY KEY,
   firstname VARCHAR(50) NOT NULL,
   lastname VARCHAR(50) NOT NULL,
   address VARCHAR(100) NOT NULL,
   ssn INT NOT NULL,
   pos VARCHAR(50) NOT NULL,
   status Boolean NOT NULL,
   salary INT NOT NULL
);

CREATE TABLE IF NOT EXISTS DrawerVerif (
   verifID serial PRIMARY KEY,
   reg INT NOT NULL,
   currAmount INT NOT NULL,
   enteredAmount INT NOT NULL,
   overShort INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ImprestVerif (
   impID serial PRIMARY KEY,
   ones INT NOT NULL,
   fives INT NOT NULL,
   tens INT NOT NULL,
   twenties INT NOT NULL,
   fifties INT NOT NULL,
   hundreds INT NOT NULL,
   pennies DECIMAL(3,1) NOT NULL,
   nickels INT NOT NULL,
   dimes INT NOT NULL,
   quarters INT NOT NULL
);

CREATE TABLE IF NOT EXISTS DCR (
   dcrID serial PRIMARY KEY,
   sales INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Deposit (
   depID serial PRIMARY KEY,
   amount INT NOT NULL
);

CREATE TABLE IF NOT EXISTS OTC (
   upcO BIGINT PRIMARY KEY,
   item INT NOT NULL,
   otcName VARCHAR(100) NOT NULL,
   otcID VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS NonOTC (
   upcN BIGINT PRIMARY KEY,
   item INT NOT NULL,
   name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Prescriptions (
   upcP BIGINT PRIMARY KEY,
   prescriptionName VARCHAR(100) NOT NULL,
   expiration DATE NOT NULL DEFAULT CURRENT_DATE 
);

CREATE TABLE IF NOT EXISTS Price (
   upc BIGINT PRIMARY KEY,
   retailP INT NOT NULL,
   saleP INT NOT NULL,
   mumd INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Operations (
   upcOp BIGINT PRIMARY KEY,
   boh INT NOT NULL,
   shelfCap INT NOT NULL,
   quickPick INT NOT NULL
);

/******Relation Table Creations******/

CREATE TABLE IF NOT EXISTS VerifysDrawer (
   eID serial NOT NULL,
   verifID serial NOT NULL,
   dateVerifiedDrawer TIMESTAMP NOT NULL,
   PRIMARY KEY (eID, verifID),
   FOREIGN KEY (eID) 
      REFERENCES Employee (eID),
   FOREIGN KEY (verifID)
      REFERENCES DrawerVerif (verifID)
);

CREATE TABLE IF NOT EXISTS VerifysImprest (
   eID serial NOT NULL,
   impID serial NOT NULL,
   dateVerifiedImprest TIMESTAMP NOT NULL,
   PRIMARY KEY (eID, impID),
   FOREIGN KEY (eID)
      REFERENCES Employee (eID),
   FOREIGN KEY (impID)
      REFERENCES ImprestVerif (impID)
);

CREATE TABLE IF NOT EXISTS Deposits (
   eID serial NOT NULL,
   depID serial NOT NULL,
   dateDeposited TIMESTAMP NOT NULL,
   PRIMARY KEY (eID, depID),
   FOREIGN KEY (eID)
      REFERENCES Employee (eID),
   FOREIGN KEY (depID)
      REFERENCES Deposit (depID)
);

CREATE TABLE IF NOT EXISTS Posts (
   eID serial NOT NULL,
   dcrID serial NOT NULL,
   datePosted TIMESTAMP NOT NULL,
   PRIMARY KEY (eID, dcrID),
   FOREIGN KEY (eID)
      REFERENCES Employee (eID),
   FOREIGN KEY (dcrID)
      REFERENCES DCR (dcrID)
);

CREATE TABLE IF NOT EXISTS Operates (
   eID serial NOT NULL,
   upcOp BIGINT NOT NULL,
   dateOperated TIMESTAMP NOT NULL,
   PRIMARY KEY (eID, upcOp),
   FOREIGN KEY (eID)
      REFERENCES Employee (eID),
   FOREIGN KEY (upcOp)
      REFERENCES Operations (upcOp)
);

CREATE TABLE IF NOT EXISTS PrescriptionOperations (
   upcP BIGINT NOT NULL,
   upcOp BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcP, upcOp),
   FOREIGN KEY (upcP)
      REFERENCES Prescriptions (upcP),
   FOREIGN KEY (upcOp)
      REFERENCES Operations (upcOp)
);

CREATE TABLE IF NOT EXISTS OTCOperations (
   upcO BIGINT NOT NULL,
   upcOp BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcO, upcOp),
   FOREIGN KEY (upcO)
      REFERENCES OTC (upcO),
   FOREIGN KEY (upcOp)
      REFERENCES Operations (upcOp)
);

CREATE TABLE IF NOT EXISTS NonOTCOperations (
   upcN BIGINT NOT NULL,
   upcOp BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcN, upcOp),
   FOREIGN KEY (upcN)
      REFERENCES NonOTC (upcN),
   FOREIGN KEY (upcOp)
      REFERENCES Operations (upcOp)
);

CREATE TABLE IF NOT EXISTS PrescriptionPrice (
   upcP BIGINT NOT NULL,
   upc BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcP, upc),
   FOREIGN KEY (upcP)
      REFERENCES Prescriptions (upcP),
   FOREIGN KEY (upc)
      REFERENCES Price (upc)
);

CREATE TABLE IF NOT EXISTS OTCPrice (
   upcO BIGINT NOT NULL,
   upc BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcO, upc),
   FOREIGN KEY (upcO)
      REFERENCES OTC (upcO),
   FOREIGN KEY (upc)
      REFERENCES Price (upc)
);

CREATE TABLE IF NOT EXISTS NonOTCPrice (
   upcN BIGINT NOT NULL,
   upc BIGINT NOT NULL,
   dateUpdated TIMESTAMP NOT NULL,
   PRIMARY KEY (upcN, upc),
   FOREIGN KEY (upcN)
      REFERENCES NonOTC (upcN),
   FOREIGN KEY (upc)
      REFERENCES Price (upc)
);

/******Data Insertion VIA CSV******/

COPY Employee(eID, firstname, lastname, address, ssn, pos, status, salary)
FROM '/Users/Shared/DB Systems Data Creation Entites - Employee.csv'
DELIMITER ','
CSV HEADER;

COPY DrawerVerif(verifID, reg, currAmount, enteredAmount, overshort)
FROM '/Users/Shared/DB Systems Data Creation Entites - DrawerVerif.csv'
DELIMITER ','
CSV HEADER;

COPY ImprestVerif(impID, ones, fives, tens, twenties, fifties, hundreds, pennies, nickels, dimes, quarters)
FROM '/Users/Shared/DB Systems Data Creation Entites - ImprestVerif.csv'
DELIMITER ','
CSV HEADER;

COPY DCR(dcrID, sales)
FROM '/Users/Shared/DB Systems Data Creation Entites - DCR.csv'
DELIMITER ','
CSV HEADER;

COPY Deposit(depID, amount)
FROM '/Users/Shared/DB Systems Data Creation Entites - Deposit.csv'
DELIMITER ','
CSV HEADER;

COPY OTC(upcO, item, otcName, otcID)
FROM '/Users/Shared/DB Systems Data Creation Entites - OTC.csv'
DELIMITER ','
CSV HEADER;

COPY NonOTC(upcN, item, name)
FROM '/Users/Shared/DB Systems Data Creation Entites - Non-OTC.csv'
DELIMITER ','
CSV HEADER;

COPY Prescriptions(upcP, prescriptionName, expiration)
FROM '/Users/Shared/DB Systems Data Creation Entites - Prescriptions.csv'
DELIMITER ','
CSV HEADER;

COPY Price(upc, retailP, saleP, mumd)
FROM '/Users/Shared/DB Systems Data Creation Entites - Price.csv'
DELIMITER ','
CSV HEADER;

COPY Operations(upcOp, boh, shelfCap, quickPick)
FROM '/Users/Shared/DB Systems Data Creation Entites - Operations.csv'
DELIMITER ','
CSV HEADER;

COPY VerifysDrawer(dateVerifiedDrawer, eID, verifID)
FROM '/Users/Shared/DB Systems Data Creation Relations - verifysDrawer.csv'
DELIMITER ','
CSV HEADER;

COPY VerifysImprest(dateVerifiedImprest, eID, impID)
FROM '/Users/Shared/DB Systems Data Creation Relations - verifysImprest.csv'
DELIMITER ','
CSV HEADER;

COPY Deposits(dateDeposited, eID, depID)
FROM '/Users/Shared/DB Systems Data Creation Relations - deposits.csv'
DELIMITER ','
CSV HEADER;

COPY Posts(datePosted, eID, dcrID)
FROM '/Users/Shared/DB Systems Data Creation Relations - posts.csv'
DELIMITER ','
CSV HEADER;

COPY Operates(dateOperated, eID, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - operates.csv'
DELIMITER ','
CSV HEADER;

COPY PrescriptionOperations(dateUpdated, upcP, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - prescriptionOperations.csv'
DELIMITER ','
CSV HEADER;

COPY OTCOperations(dateUpdated, upcO, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - otcOperations.csv'
DELIMITER ','
CSV HEADER;

COPY NonOTCOperations(dateUpdated, upcN, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - nonOTCOperations.csv'
DELIMITER ','
CSV HEADER;

COPY PrescriptionPrice(dateUpdated, upcP, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - prescriptionPrice.csv'
DELIMITER ','
CSV HEADER;

COPY OTCPrice(dateUpdated, upcO, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - otcPrice.csv'
DELIMITER ','
CSV HEADER;

COPY NonOTCPrice(dateUpdated, upcN, upcOp)
FROM '/Users/Shared/DB Systems Data Creation Relations - nonOTCPrice.csv'
DELIMITER ','
CSV HEADER;














































































