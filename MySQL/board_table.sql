
use mydb;


CREATE TABLE boards (
    bno        INT PRIMARY KEY,          
    writer     VARCHAR(10) NOT NULL,      
    subject    VARCHAR(50) NOT NULL,      
    reg_date   DATETIME NOT NULL,       
    bdate      DATE DEFAULT CURRENT_DATE, 
    readcount  INT DEFAULT 0              
);



