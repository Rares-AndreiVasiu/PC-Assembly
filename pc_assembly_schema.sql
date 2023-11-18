DROP TABLE pcComponent;
DROP TABLE pcClient;
DROP TABLE pcOrder;
DROP TABLE pcOrderList;

CREATE TABLE pcComponent
(
    codC VARCHAR2 (200) NOT NULL, 

    name VARCHAR2 (200), 
    
    producer VARCHAR2 (60), 
    
    price NUMBER(10,2),

    CONSTRAINT cnt1 PRIMARY KEY(codC)
);

CREATE TABLE pcClient
(
    pnc NUMBER(13,0) NOT NULL, 
    
    name VARCHAR2 (32), 
    
    email VARCHAR2 (35),

    CONSTRAINT cnt2 PRIMARY KEY(pnc)
);

CREATE TABLE pcOrder
(
    codO VARCHAR2(6) NOT NULL,  

    pnc NUMBER (13,0) NOT NULL,
    
    orderDate DATE,

    CONSTRAINT codO_pk PRIMARY KEY(codO),

    CONSTRAINT pnc_fk FOREIGN KEY(pnc) REFERENCES pcClient(pnc) ON DELETE CASCADE
);

CREATE TABLE pcOrderList
(
    codO VARCHAR2(6) NOT NULL, 

    codC VARCHAR2 (200) NOT NULL, 
    
    quantity NUMBER (5,0),

    CONSTRAINT codO_fk FOREIGN KEY(codO) REFERENCES pcOrder(codO) ON DELETE CASCADE;

    CONSTRAINT codc_fk FOREIGN KEY(codC) REFERENCES pcComponent(codC) ON DELETE CASCADE;
);