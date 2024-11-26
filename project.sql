-- ΔΗΜΙΟΥΡΓΙΑ ΠΙΝΑΚΑ customer.
USE mydb;
CREATE TABLE customer (
id int NOT NULL PRIMARY KEY auto_increment,
first_name varchar(30),
last_name varchar(30),
phone varchar(20));


INSERT INTO customer (first_name,last_name,phone) VALUES ('Nikos','Papadopoulos','6956373829');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Kostas','Petridis','6904736254');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Petros','Ioannou','6984769502');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Giannis','Triantis','6974536574');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Periklis','Stasinos','6967842113');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Andreas','Christopoulos','6976545321');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Katerina','Papadimitriou','6990976845');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Maria','Petropoulou','6980453322');
INSERT INTO customer (first_name,last_name,phone) VALUES ('Ioanna','Nomikou','6990675843');
SELECT * FROM customer;

-- ΔΗΜΙΟΥΡΓΙΑ ΠΙΝΑΚΑ products.

CREATE TABLE products (
id int NOT NULL PRIMARY KEY auto_increment,
descriptions varchar(50),
price decimal(6,2));



INSERT INTO products (descriptions,price) VALUES ('koulourakia',3.60);
INSERT INTO products (descriptions,price) VALUES ('tiropita',1.70);
INSERT INTO products (descriptions,price) VALUES ('krouasanakia',3.40);
INSERT INTO products (descriptions,price) VALUES ('xortopita',2.30);
INSERT INTO products (descriptions,price) VALUES ('pizza',2.10);
INSERT INTO products (descriptions,price) VALUES ('mpiftekopita',2.50);
INSERT INTO products (descriptions,price) VALUES ('kotopita',2.30);
INSERT INTO products (descriptions,price) VALUES ('donat',1.50);
INSERT INTO products (descriptions,price) VALUES ('kreatopita',2.20);
SELECT * FROM products;

-- ΔΗΜΙΟΥΡΓΙΑ ΠΙΝΑΚΑ orders.

CREATE TABLE orders (
id int NOT NULL PRIMARY KEY auto_increment,
customers_id int);

INSERT INTO orders (customers_id) VALUES (2);
INSERT INTO orders (customers_id) VALUES (2);
INSERT INTO orders (customers_id) VALUES (2);
INSERT INTO orders (customers_id) VALUES (4);
INSERT INTO orders (customers_id) VALUES (4);
INSERT INTO orders (customers_id) VALUES (7);
INSERT INTO orders (customers_id) VALUES (7);
INSERT INTO orders (customers_id) VALUES (7);
INSERT INTO orders (customers_id) VALUES (9);
SELECT * FROM orders;






-- ΘΕΛΟΥΜΕ ΝΑ ΒΡΟΥΜΕ ΠΟΙΟΙ ΕΙΝΑΙ ΟΙ ΠΡΩΤΟΙ 4 ΠΕΛΑΤΕΣ ΠΟΥ ΠΑΡΗΓΓΕΙΛΑΝ ΑΠΟ ΤΟΝ ΠΙΝΑΚΑ customer.
SELECT * FROM customer LIMIT 4;

-- ΘΕΛΟΥΜΕ ΝΑ ΤΑΞΙΝΟΜΗΣΟΥΜΕ ΤΑ ΟΝΟΜΑΤΑ ΤΩΝ ΠΕΛΑΤΩΝ ΑΠΟ ΤΟΝ ΠΙΝΑΚΑ customer ΣΕ ΑΛΦΑΒΗΤΙΚΗ ΣΕΙΡΑ A-Z. 
SELECT * FROM customer ORDER BY first_name ASC;

-- ΘΕΛΟΥΜΕ ΑΠΟ ΤΟΝ ΠΙΝΑΚΑ products ΝΑ ΒΡΟΥΜΕ ΠΟΙΑ ΠΡΟΙΟΝΤΑ ΚΟΣΤΙΖΟΥΝ ΚΑΤΩ ΑΠΟ 2 ΕΥΡΩ ΚΑΙ ΝΑ ΤΑ ΠΑΡΟΥΣΙΑΣΕΙ ΑΠΟ ΤΗΝ ΜΙΚΡΟΤΕΡΗ ΤΙΜΗ ΣΤΗ ΜΕΓΑΛΥΤΕΡΗ.
SELECT descriptions,price FROM products WHERE price<2 ORDER BY price ASC;

-- ΣΤΟΝ ΠΙΝΑΚΑ orders ΕΧΟΥΜΕ ΤΟ id ΤΩΝ ΠΕΛΑΤΩΝ ΠΟΥ ΕΚΑΝΑΝ ΤΙΣ ΠΑΡΑΓΓΕΛΙΕΣ ΑΛΛΑ ΤΩΡΑ ΘΑ ΜΑΘΟΥΜΕ ΚΑΙ ΤΑ ΣΤΟΙΧΕΙΑ ΤΟΥΣ ΑΝΑΛΥΤΙΚΑ ΚΑΝΟΝΤΑΣ LEFT JOIN ΤΟΥΣ ΠΙΑΝΚΕΣ orders & customer.
SELECT * FROM orders 
 LEFT JOIN customer
 ON orders.customers_id=customer.id;
 

 ----------------------------------------------------------------------------------------------------------
 -- ΔΗΜΙΟΥΡΓΙΑ ΠΙΝΑΚΑ realestate.

CREATE TABLE realestate (
first_name varchar(20),
location varchar(20),
houses int);


INSERT INTO realestate (first_name,location,houses) VALUES ('Nikos','PATRA',5);
INSERT INTO realestate (first_name,location,houses) VALUES ('Kostas','ATHINA',3);
INSERT INTO realestate (first_name,location,houses) VALUES ('Petros','ATHINA',13);
INSERT INTO realestate (first_name,location,houses) VALUES ('Giannis','PATRA',7);
INSERT INTO realestate (first_name,location,houses) VALUES ('Periklis','THESSALONIKI',1);
INSERT INTO realestate (first_name,location,houses) VALUES ('Andreas','ATHINA',2);
INSERT INTO realestate (first_name,location,houses) VALUES ('Katerina','THESSALONIKI',4);
INSERT INTO realestate (first_name,location,houses) VALUES ('Maria','THESSALONIKI',20);
INSERT INTO realestate (first_name,location,houses) VALUES ('Ioanna','PATRA',10);


-- ΘΑ ΠΡΟΣΘΕΣΩ ΕΝΑ raw number ΟΠΟΥ ΣΤΟ ΝΟΥΜΕΡΟ ΕΝΑ ΘΑ ΕΙΝΑΙ Η ΜΕΓΑΛΥΤΕΡΗ ΤΙΜΗ ΤΗΣ ΣΤΗΛΗΣ HOUSES.ΑΡΑ ΘΑ ΞΕΚΙΝΑ Η ΣΤΗΛΗ ΑΠΟ ΤΟΝ ΑΝΘΡΩΠΟ ΠΟΥ ΠΟΥΛΗΣΕ ΤΑ ΠΙΟ ΠΟΛΛΑ ΣΠΙΤΙΑ.

SELECT first_name,location,houses,row_number() over (order by houses desc) as rownum from realestate;

 
 -- ΤΩΡΑ ΠΟΥ ΔΩΣΑΜΕ ROW NUMBER ΜΠΟΡΟΥΜΕ ΝΑ ΒΡΟΥΜΕ ΠΟΙΟΣ ΕΙΝΑΙ ΠΧ Ο ΕΒΔΟΜΟΣ ΚΑΛΥΤΕΡΟΣ ΣΕ ΠΩΛΗΣΕΙΣ.
 SELECT * FROM (SELECT first_name,location,houses,row_number() over (order by houses desc) as rownum from realestate)temptable WHERE rownum=7;

-- ΘΕΛΟΥΜΕ ΝΑ ΔΟΥΜΕ ΤΑ ΔΕΔΟΜΕΝΑ ΤΟΥ ΠΙΝΑΚΑ ΜΑΣ ΟΜΑΔΟΠΟΙΗΜΕΝΑ ΣΥΜΦΩΝΑ ΜΕ ΤΗΝ ΠΕΡΙΟΧΗ(ΕΔΩ ΤΟ ROWNUM ΘΑ ΔΩΣΕΙ ΤΗ ΣΕΙΡΑ ΣΥΜΦΩΝΑ ΜΕ ΤΗΝ ΠΕΡΙΟΧΗ).
SELECT first_name,location,houses,row_number() OVER (PARTITION BY location ORDER BY houses desc) FROM realestate;

-- ΤΩΡΑ ΘΑ ΕΦΑΡΜΟΣΟΥΜΕ FUNCTIONS.ΠΧ SUM ΓΙΑ ΤΟ ΣΥΝΟΛΟ ΤΩΝ ΣΠΙΤΙΩΝ ΠΟΥ ΠΟΥΛΗΘΗΚΑΝ.
SELECT sum(houses) AS total FROM realestate;

-- ΑΝ ΘΕΛΩ ΝΑ ΒΡΩ ΠΟΣΑ ΣΠΙΤΙΑ ΠΟΥΛΗΘΗΚΑΝ ΣΥΝΟΛΙΚΑ ΣΕ ΚΑΘΕ ΠΕΡΙΟΧΗ.ΕΠΙΣΗΣ ΜΠΟΡΩ ΝΑ ΒΡΩ ΚΑΙ ΤΗ ΜΙΚΡΟΤΕΡΗ ΠΩΛΗΣΗ ΠΟΥ ΕΓΙΝΕ.
SELECT location,sum(houses) AS total FROM realestate GROUP BY location;
SELECT min(houses) FROM realestate;

 -- ΘΕΛΩ ΝΑ ΒΡΩ ΠΟΣΕΣ ΠΕΡΙΟΧΕΣ ΕΧΟΥΝ MAXIMUM ΠΩΛΗΣΕΙΣ ΚΑΤΩ ΤΩΝ 15 ΣΠΙΤΙΩΝ.KAI ΧΡΗΣΗ ΣΑΝ CTE.
 
SELECT COUNT(*) FROM (SELECT location,max(houses) AS MAX_PRICE FROM realestate GROUP BY location) AS MAXSALES WHERE MAX_PRICE<15;

-- ΧΡΗΣΗ CTE
WITH MAXSALES AS (SELECT location,max(houses) AS MAX_PRICE 
				 FROM realestate 
                 GROUP BY location) 
SELECT COUNT(*)
FROM MAXSALES
WHERE MAX_PRICE<15;    

-- ΘΑ ΔΗΜΙΟΥΡΓΗΣΩ index ΣΤΗ ΣΤΗΛΗ ΠΧ first_name ΓΙΑ ΓΡΗΓΟΡΟ ΕΝΤΟΠΙΣΜΟ ΤΩΝ ΔΕΔΟΜΕΝΩΝ ΧΩΡΙΣ ΝΑ ΧΡΕΙΑΖΕΤΑΙ ΝΑ ΨΑΧΝΕΙ ΚΑΘΕ ΣΕΙΡΑ.
CREATE INDEX firstname_idx ON realestate(first_name);
            
CREATE TABLE dates (
dt DATE,
SALES INT);
INSERT INTO dates(dt,SALES) VALUES ('2023-02-01',300);
INSERT INTO dates(dt,SALES) VALUES ('2023-02-03',100);
INSERT INTO dates(dt,SALES) VALUES ('2023-02-05',200);
INSERT INTO dates(dt,SALES) VALUES ('2023-02-06',300);
SELECT* FROM dates;

-- ΑΝ ΘΕΛΩ ΝΑ ΒΑΛΩ ΚΑΙ ΤΙΣ ΕΝΔΙΑΜΕΣΕΣ ΗΜΕΡΟΜΗΝΙΕΣ ΠΟΥ ΛΕΙΠΟΥΝ ΘΑ ΔΗΜΙΟΥΡΓΗΣΩ ΜΙΑ ΕΠΑΝΑΛΗΠΤΙΚΗ ΔΙΑΔΙΚΑΣΙΑ.
WITH RECURSIVE cte_dates(dt) AS 
(SELECT '2023-02-01' UNION ALL 
SELECT DATE_ADD(dt,INTERVAL 1 DAY)
FROM cte_dates WHERE dt< '2023-02-06')
SELECT * FROM cte_dates;





