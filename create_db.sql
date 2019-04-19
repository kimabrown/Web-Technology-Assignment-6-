DROP TABLE orders1;
DROP TABLE product;
DROP TABLE customer;
DROP TABLE registration;

CREATE TABLE product
(item_no varchar(4) not null,
 ebook_name varchar(30) not null,
 price numeric(9,2) not null,
 inventory numeric(1) not null,
 quantity numeric(1) not null,
 image varchar(30) not null,  
 description varchar(100) not null 
 );

CREATE TABLE customer
 (cc_no numeric(16) not null,   
  exp_mo numeric(2) not null,
  exp_yr numeric(4) not null,
  name_first varchar(20) not null,
  name_last varchar(20) not null,
  email varchar(20) not null,
  address1 varchar(50) not null,
  address2 varchar(50),  
  city varchar(20) not null,
  state varchar(2) not null,
  zip numeric(5) not null,
  country varchar(20),
  phone varchar(15) not null,
  fax varchar(15) not null,
  mail_list numeric(1)   
 );

CREATE TABLE orders1
 (quantity numeric(1),
  date_sold DATETIME not null,
  item_no varchar(4) not null,
  cc_no numeric(16) not null
 );

CREATE TABLE registration
(username varchar(16) not null, 
 password varchar(16) not null, 
 email varchar(50) not null
 );

ALTER TABLE product
ADD CONSTRAINT product_item_no_pk PRIMARY KEY(item_no);

ALTER TABLE customer
ADD CONSTRAINT customer_cc_no_pk PRIMARY KEY(cc_no);

ALTER TABLE orders1
ADD CONSTRAINT orders1_item_cc_pk PRIMARY KEY(item_no,cc_no);

ALTER TABLE registration
ADD CONSTRAINT registration_username_pk PRIMARY KEY(username);

ALTER TABLE orders1
ADD CONSTRAINT orders1_item_no_fk FOREIGN KEY(item_no)
REFERENCES product(item_no);

ALTER TABLE orders1
ADD CONSTRAINT orders1_cc_no_fk FOREIGN KEY(cc_no)
REFERENCES customer(cc_no);

INSERT INTO product
VALUES ('01', 'The Exercise Cure', '1.99', 5, 1, 'exercise.jpg', 'A Doctors All Natural Solution to Better Health and a Longer Life');

INSERT INTO product
VALUES ('02', 'Daniel Plan', '2.99', 5, 2, 'HealthPlan.jpg', 'The Tried and Tested Dietary Plan to Change Your Life.');

INSERT INTO product
VALUES ('03', 'Soul Healing', '1.99', 5, 3, 'soul.jpg', 'A Guide to a Happy and Healthy Life by Basic Lifestyle Changes.');

INSERT INTO product
VALUES ('04', 'Wheat Belly', '0.99', 5, 2, 'WheatBelly.jpg', 'Wheat – The Real Wonder Food for the 21st Century.');

INSERT INTO product
VALUES ('05', 'What To Expect', '3.99', 5, 1, 'expect.jpg', 'A Health and Exercise Guide for Expecting Mothers.');

INSERT INTO product
VALUES ('06', 'The First Year', '1.99', 5, 4, 'expect1.jpg', 'A Health and Exercise Guide for Mothers in their First.');

INSERT INTO product
VALUES ('07', 'Hands Free Mama', '0.99', 5, 5, 'mama.jpg', 'Become a Multi-Tasking Mama with Less Stress.');

INSERT INTO product
VALUES ('08', 'Talk To Kids', '2.99', 5, 1, 'talk.jpg', 'A Guide to Communicating with Your Children.');


/* TABLE DESCRIPTIONS BELOW

MariaDB [student_space]> desc orders1
    -> ;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| quantity  | decimal(1,0)  | YES  |     | NULL    |       |
| date_sold | datetime      | NO   |     | NULL    |       |
| item_no   | varchar(4)    | NO   | PRI | NULL    |       |
| cc_no     | decimal(16,0) | NO   | PRI | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

MariaDB [student_space]> desc customer;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| cc_no      | decimal(16,0) | NO   | PRI | NULL    |       |
| exp_mo     | decimal(2,0)  | NO   |     | NULL    |       |
| exp_yr     | decimal(4,0)  | NO   |     | NULL    |       |
| name_first | varchar(20)   | NO   |     | NULL    |       |
| name_last  | varchar(20)   | NO   |     | NULL    |       |
| email      | varchar(20)   | NO   |     | NULL    |       |
| address1   | varchar(50)   | NO   |     | NULL    |       |
| address2   | varchar(50)   | YES  |     | NULL    |       |
| city       | varchar(20)   | NO   |     | NULL    |       |
| state      | varchar(2)    | NO   |     | NULL    |       |
| zip        | decimal(5,0)  | NO   |     | NULL    |       |
| country    | varchar(20)   | YES  |     | NULL    |       |
| phone      | varchar(15)   | NO   |     | NULL    |       |
| fax        | varchar(15)   | NO   |     | NULL    |       |
| mail_list  | decimal(1,0)  | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
15 rows in set (0.03 sec)

MariaDB [student_space]> desc registration;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| username | varchar(16) | NO   | PRI | NULL    |       |
| password | varchar(16) | NO   |     | NULL    |       |
| email    | varchar(50) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

MariaDB [student_space]> desc product;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| item_no     | varchar(4)   | NO   | PRI | NULL    |       |
| ebook_name  | varchar(30)  | NO   |     | NULL    |       |
| price       | decimal(9,2) | NO   |     | NULL    |       |
| inventory   | decimal(1,0) | NO   |     | NULL    |       |
| quantity    | decimal(1,0) | NO   |     | NULL    |       |
| image       | varchar(30)  | NO   |     | NULL    |       |
| description | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

MariaDB [student_space]>

