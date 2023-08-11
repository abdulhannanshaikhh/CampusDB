mysql> create database college_database;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college_database   |
| company            |
| db                 |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
9 rows in set (0.00 sec)

mysql> use college_database;
Database changed
mysql> CREATE TABLE departments (
    ->   id int(11) NOT NULL,
    ->   name varchar(30) NOT NULL,
    ->   primary key(id)
    -> ) ;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO departments (id,name) VALUES
    -> (1, 'Mechanical'),
    -> (2,'Civil'),
    -> (3,'Compueter Science'),
    -> (4, 'Information Technology'),
    -> (5,'Electronics and communication'),
    -> (6,'Electrical and Electronics'),
    -> (7,'Petroleum'),
    -> (8,'Aerospace'),
    -> (9,'Automobile'),
    -> (10,'Aeronautical');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> show tables;
+----------------------------+
| Tables_in_college_database |
+----------------------------+
| departments                |
+----------------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE faculty (
    ->   id int(11) NOT NULL,
    ->   name varchar(25) NOT NULL,
    ->   department_id int(11) NOT NULL,
    ->   phone int(20) DEFAULT NULL,
    -> primary key(id),foreign key(department_id) references departments(id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO faculty (id, name, department_id, phone) VALUES
    -> (1, 'Manisha', 1, '9845167849'),
    -> (2, 'Anil', 1, '7785461895'),
    -> (3, 'Vijayalakshmi', 2, '8983547891'),
    -> (4, 'Adityakumar', 2, '9890451786'),
    -> (5, 'Shubhangi',3, '9422185769'),
    -> (6, 'Minal', 3, '7986523467'),
    -> (7, 'Renuka', 4, '8945679876'),
    -> (8, 'Tanveer', 4, '8578093456'),
    -> (9, 'Afroz', 5, '9856345676'),
    -> (10, 'Raghavendra', 5, '7873456543'),
    -> (11, 'Ravi', 6, '9811267849'),
    -> (12, 'Swapnil', 6, '9875261895'),
    -> (13, 'Shanaz', 7, '801237891'),
    -> (14, 'Almaz', 7, '9563451786'),
    -> (15, 'Shivani',8, '7542385769'),
    -> (16, 'Farhan', 8, '9653423467'),
    -> (17, 'Krisha', 9, '6361279876'),
    -> (18, 'Mazahir', 9, '6532493456'),
    -> (19, 'Akram', 10, '653415676'),
    -> (20, 'Ravindran', 10, '6789756543');
Query OK, 20 rows affected, 18 warnings (0.01 sec)
Records: 20  Duplicates: 0  Warnings: 18

mysql> CREATE TABLE students (
    ->   rollno int(11) NOT NULL,
    ->   name varchar(25) NOT NULL,
    ->   department_id int(11) not NULL,
    ->   phone int(20) DEFAULT NULL,
    ->   admission_date date NOT NULL,
    ->   cet_no int(11) NOT NULL,
    ->   faculty_id int(10) not null,
    -> primary key(rollno),
    -> foreign key(department_id) references departments(id),
    -> foreign key(faculty_id) references faculty(id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO students (rollno, name, department_id, phone, admission_date, cet_no, faculty_id) VALUES
    -> (101, 'Vinod', 1, '7474986413', '2017-08-01', 107,1),
    -> (102, 'Adwait', 1, '8862451783', '2017-08-01', 113,1),
    -> (103, 'Aashay', 2, '9029742685', '2017-08-21', 140,1),
    -> (104, 'Atharva', 2, '7093458923', '2017-08-21', 132,2),
    -> (105, 'Rashmi', 3, '9552514123', '2017-08-01', 125, 2),
    -> (106, 'Shivam', 3, '7415487595', '2017-08-21', 141, 2),
    -> (107, 'Sunanda', 4, '9423165742', '2017-08-21', 130, 3),
    -> (108, 'Sagar', 4, '9545791532', '2017-08-21', 150, 3),
    -> (109, 'Shreya', 5, '7093458923', '2017-08-21', 131, 3),
    -> (110, 'hannan', 5, '6323432235', '2017-08-21', 556, 4),
    -> (111, 'adnan', 6, '7652136413', '2018-09-23', 126,4),
    -> (112, 'zaid', 6, '8863351783', '2018-09-23', 174,4),
    -> (113, 'mehboob', 7, '9975342685', '2018-09-23', 123,5),
    -> (114, 'Abdulah', 7, '772358923', '2018-09-23', 111,5),
    -> (115, 'jadav', 8, '9764244123', '2018-09-23', 122, 5),
    -> (116, 'Shanaz', 8, '7434287595', '2018-09-25', 144, 6),
    -> (117, 'Sundara', 9, '9454265742', '2018-09-25', 134, 6),
    -> (118, 'Sharanya', 9, '9423491532', '2018-09-25', 154, 6),
    -> (119, 'Smitha', 10, '797238923', '2018-09-25', 154, 7),
    -> (120, 'Reddy', 10, '652462235', '2018-09-26', 545, 7),
    -> (121, 'altaf', 1, '6274986413', '2019-03-01', 078,8),
    -> (122, 'sikandar', 1, '6562451783', '2019-03-01', 011,16),
    -> (123, 'sukhvinder', 2, '6229742685', '2019-03-21', 140,8),
    -> (124, 'samad', 2, '6193458923', '2019-03-21', 032,9),
    -> (125, 'faraz', 3, '6952514123', '2019-03-01', 025, 9),
    -> (126, 'Saaim', 3, '7115487595', '2019-03-21', 041, 10),
    -> (127, 'fazle', 4, '7123165742', '2019-03-21', 030, 10),
    -> (128, 'mohsin', 4, '7345791532', '2019-03-21', 050, 11),
    -> (129, 'Shaiz', 5, '7293458923', '2019-03-21', 031, 11),
    -> (130, 'mannan', 5, '7923432235', '2019-03-21', 756, 11),
    -> (131, 'aqib', 6, '8852136413', '2020-05-23', 726,12),
    -> (132, 'mazhar', 6, '8463351783', '2020-05-23', 774,12),
    -> (133, 'azhar', 7, '8975342685', '2020-05-23', 723,13),
    -> (134, 'zuhair', 7, '852358923', '2020-05-23', 511,12),
    -> (135, 'kamil', 8, '8464244123', '2020-05-23', 422, 14),
    -> (136, 'john', 8, '9734287595', '2020-05-25', 344, 14),
    -> (137, 'daniel', 9, '9854265742', '2020-05-25', 234, 15),
    -> (138, 'panda', 9, '9223491532', '2020-05-25', 254, 16),
    -> (139, 'kouser', 10, '907238923', '2020-05-25', 254, 17),
    -> (140, 'zahid', 10, '912462235', '2020-05-26', 145, 19);
Query OK, 40 rows affected, 34 warnings (0.01 sec)
Records: 40  Duplicates: 0  Warnings: 34

mysql> CREATE TABLE marks (
    ->   id int(11) NOT NULL,
    ->   rollno int(11) NOT NULL,
    ->   subject_id varchar(11) NOT NULL,
    ->   marks int(11) NOT NULL,
    ->  primary key(id),
    ->  foreign key(rollno) references students(rollno)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO marks (id, rollno, subject_id, marks) VALUES
    -> (1, 101, 'cse', 80),
    -> (2, 102, 'cse', 70),
    -> (3, 103, 'cse', 90),
    -> (4, 104, 'cse', 80),
    -> (5, 105, 'cse', 80),
    -> (6, 106, 'mat', 80),
    -> (7, 107, 'mat', 90),
    -> (8, 108, 'mat', 80),
    -> (9, 109, 'mat', 70),
    -> (10, 110, 'mat', 73),
    -> (11, 111, 'eng', 0),
    -> (12, 112, 'eng', 21),
    -> (13, 113, 'eng', 23),
    -> (14, 114, 'eng', 35),
    -> (15, 115, 'eng', 81),
    -> (16, 116, 'ise', 85),
    -> (17, 117, 'ise', 65),
    -> (18, 118, 'ise', 56),
    -> (19, 119, 'ise', 23),
    -> (20, 120, 'ise',12),
    -> (21, 121, 'law', 23),
    -> (22, 122, 'law', 56),
    -> (23, 123, 'law', 67),
    -> (24, 124, 'law', 78),
    -> (25, 125, 'law', 56),
    -> (26, 126, 'mgt',46),
    -> (27, 127, 'mgt', 57),
    -> (28, 128, 'mgt', 15),
    -> (29, 129, 'mgt', 35),
    -> (30, 130, 'mgt', 99),
    -> (31, 131, 'py', 43),
    -> (32, 132, 'py', 66),
    -> (33, 133, 'py', 77),
    -> (34, 134, 'py', 38),
    -> (35, 135, 'py', 26),
    -> (36, 136, 'java',46),
    -> (37, 137, 'java', 67),
    -> (38, 138, 'java', 85),
    -> (39, 139, 'java', 65),
    -> (40, 140, 'web', 100);
Query OK, 40 rows affected (0.01 sec)
Records: 40  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE subjects (
    ->   id int(11) NOT NULL,
    ->   department_id int(11) NOT NULL,
    ->   name varchar(50) NOT NULL,
    ->   faculty_id int(11) NOT NULL,
    -> primary key(id),
    -> foreign key(department_id) references departments(id),
    -> foreign key(faculty_id) references faculty(id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> select * from departments;
+----+-------------------------------+
| id | name                          |
+----+-------------------------------+
|  1 | Mechanical                    |
|  2 | Civil                         |
|  3 | Compueter Science             |
|  4 | Information Technology        |
|  5 | Electronics and communication |
|  6 | Electrical and Electronics    |
|  7 | Petroleum                     |
|  8 | Aerospace                     |
|  9 | Automobile                    |
| 10 | Aeronautical                  |
+----+-------------------------------+
10 rows in set (0.00 sec)

mysql> select * from faculty;
+----+---------------+---------------+------------+
| id | name          | department_id | phone      |
+----+---------------+---------------+------------+
|  1 | Manisha       |             1 | 2147483647 |
|  2 | Anil          |             1 | 2147483647 |
|  3 | Vijayalakshmi |             2 | 2147483647 |
|  4 | Adityakumar   |             2 | 2147483647 |
|  5 | Shubhangi     |             3 | 2147483647 |
|  6 | Minal         |             3 | 2147483647 |
|  7 | Renuka        |             4 | 2147483647 |
|  8 | Tanveer       |             4 | 2147483647 |
|  9 | Afroz         |             5 | 2147483647 |
| 10 | Raghavendra   |             5 | 2147483647 |
| 11 | Ravi          |             6 | 2147483647 |
| 12 | Swapnil       |             6 | 2147483647 |
| 13 | Shanaz        |             7 |  801237891 |
| 14 | Almaz         |             7 | 2147483647 |
| 15 | Shivani       |             8 | 2147483647 |
| 16 | Farhan        |             8 | 2147483647 |
| 17 | Krisha        |             9 | 2147483647 |
| 18 | Mazahir       |             9 | 2147483647 |
| 19 | Akram         |            10 |  653415676 |
| 20 | Ravindran     |            10 | 2147483647 |
+----+---------------+---------------+------------+
20 rows in set (0.00 sec)

mysql> select * from students;
+--------+------------+---------------+------------+----------------+--------+------------+
| rollno | name       | department_id | phone      | admission_date | cet_no | faculty_id |
+--------+------------+---------------+------------+----------------+--------+------------+
|    101 | Vinod      |             1 | 2147483647 | 2017-08-01     |    107 |          1 |
|    102 | Adwait     |             1 | 2147483647 | 2017-08-01     |    113 |          1 |
|    103 | Aashay     |             2 | 2147483647 | 2017-08-21     |    140 |          1 |
|    104 | Atharva    |             2 | 2147483647 | 2017-08-21     |    132 |          2 |
|    105 | Rashmi     |             3 | 2147483647 | 2017-08-01     |    125 |          2 |
|    106 | Shivam     |             3 | 2147483647 | 2017-08-21     |    141 |          2 |
|    107 | Sunanda    |             4 | 2147483647 | 2017-08-21     |    130 |          3 |
|    108 | Sagar      |             4 | 2147483647 | 2017-08-21     |    150 |          3 |
|    109 | Shreya     |             5 | 2147483647 | 2017-08-21     |    131 |          3 |
|    110 | hannan     |             5 | 2147483647 | 2017-08-21     |    556 |          4 |
|    111 | adnan      |             6 | 2147483647 | 2018-09-23     |    126 |          4 |
|    112 | zaid       |             6 | 2147483647 | 2018-09-23     |    174 |          4 |
|    113 | mehboob    |             7 | 2147483647 | 2018-09-23     |    123 |          5 |
|    114 | Abdulah    |             7 |  772358923 | 2018-09-23     |    111 |          5 |
|    115 | jadav      |             8 | 2147483647 | 2018-09-23     |    122 |          5 |
|    116 | Shanaz     |             8 | 2147483647 | 2018-09-25     |    144 |          6 |
|    117 | Sundara    |             9 | 2147483647 | 2018-09-25     |    134 |          6 |
|    118 | Sharanya   |             9 | 2147483647 | 2018-09-25     |    154 |          6 |
|    119 | Smitha     |            10 |  797238923 | 2018-09-25     |    154 |          7 |
|    120 | Reddy      |            10 |  652462235 | 2018-09-26     |    545 |          7 |
|    121 | altaf      |             1 | 2147483647 | 2019-03-01     |     78 |          8 |
|    122 | sikandar   |             1 | 2147483647 | 2019-03-01     |     11 |         16 |
|    123 | sukhvinder |             2 | 2147483647 | 2019-03-21     |    140 |          8 |
|    124 | samad      |             2 | 2147483647 | 2019-03-21     |     32 |          9 |
|    125 | faraz      |             3 | 2147483647 | 2019-03-01     |     25 |          9 |
|    126 | Saaim      |             3 | 2147483647 | 2019-03-21     |     41 |         10 |
|    127 | fazle      |             4 | 2147483647 | 2019-03-21     |     30 |         10 |
|    128 | mohsin     |             4 | 2147483647 | 2019-03-21     |     50 |         11 |
|    129 | Shaiz      |             5 | 2147483647 | 2019-03-21     |     31 |         11 |
|    130 | mannan     |             5 | 2147483647 | 2019-03-21     |    756 |         11 |
|    131 | aqib       |             6 | 2147483647 | 2020-05-23     |    726 |         12 |
|    132 | mazhar     |             6 | 2147483647 | 2020-05-23     |    774 |         12 |
|    133 | azhar      |             7 | 2147483647 | 2020-05-23     |    723 |         13 |
|    134 | zuhair     |             7 |  852358923 | 2020-05-23     |    511 |         12 |
|    135 | kamil      |             8 | 2147483647 | 2020-05-23     |    422 |         14 |
|    136 | john       |             8 | 2147483647 | 2020-05-25     |    344 |         14 |
|    137 | daniel     |             9 | 2147483647 | 2020-05-25     |    234 |         15 |
|    138 | panda      |             9 | 2147483647 | 2020-05-25     |    254 |         16 |
|    139 | kouser     |            10 |  907238923 | 2020-05-25     |    254 |         17 |
|    140 | zahid      |            10 |  912462235 | 2020-05-26     |    145 |         19 |
+--------+------------+---------------+------------+----------------+--------+------------+
40 rows in set (0.00 sec)

mysql> select * from marks;
+----+--------+------------+-------+
| id | rollno | subject_id | marks |
+----+--------+------------+-------+
|  1 |    101 | cse        |    80 |
|  2 |    102 | cse        |    70 |
|  3 |    103 | cse        |    90 |
|  4 |    104 | cse        |    80 |
|  5 |    105 | cse        |    80 |
|  6 |    106 | mat        |    80 |
|  7 |    107 | mat        |    90 |
|  8 |    108 | mat        |    80 |
|  9 |    109 | mat        |    70 |
| 10 |    110 | mat        |    73 |
| 11 |    111 | eng        |     0 |
| 12 |    112 | eng        |    21 |
| 13 |    113 | eng        |    23 |
| 14 |    114 | eng        |    35 |
| 15 |    115 | eng        |    81 |
| 16 |    116 | ise        |    85 |
| 17 |    117 | ise        |    65 |
| 18 |    118 | ise        |    56 |
| 19 |    119 | ise        |    23 |
| 20 |    120 | ise        |    12 |
| 21 |    121 | law        |    23 |
| 22 |    122 | law        |    56 |
| 23 |    123 | law        |    67 |
| 24 |    124 | law        |    78 |
| 25 |    125 | law        |    56 |
| 26 |    126 | mgt        |    46 |
| 27 |    127 | mgt        |    57 |
| 28 |    128 | mgt        |    15 |
| 29 |    129 | mgt        |    35 |
| 30 |    130 | mgt        |    99 |
| 31 |    131 | py         |    43 |
| 32 |    132 | py         |    66 |
| 33 |    133 | py         |    77 |
| 34 |    134 | py         |    38 |
| 35 |    135 | py         |    26 |
| 36 |    136 | java       |    46 |
| 37 |    137 | java       |    67 |
| 38 |    138 | java       |    85 |
| 39 |    139 | java       |    65 |
| 40 |    140 | web        |   100 |
+----+--------+------------+-------+
40 rows in set (0.00 sec)

mysql> select * from subjects;
+-----+---------------+------+------------+
| id  | department_id | name | faculty_id |
+-----+---------------+------+------------+
| 201 |             1 | java |          1 |
| 202 |             2 | mgt  |          1 |
| 203 |             3 | py   |          1 |
| 204 |             4 | law  |          1 |
| 205 |             5 | ise  |          1 |
| 206 |             6 | eng  |          1 |
| 207 |             7 | mat  |          1 |
| 208 |             8 | cse  |          1 |
| 209 |             9 | web  |          1 |
| 210 |            10 | os   |          1 |
+-----+---------------+------+------------+
10 rows in set (0.00 sec)

mysql> desc departments;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(30) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> desc faculty;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| name          | varchar(25) | NO   |     | NULL    |       |
| department_id | int(11)     | NO   | MUL | NULL    |       |
| phone         | int(20)     | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> desc students;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| rollno         | int(11)     | NO   | PRI | NULL    |       |
| name           | varchar(25) | NO   |     | NULL    |       |
| department_id  | int(11)     | NO   | MUL | NULL    |       |
| phone          | int(20)     | YES  |     | NULL    |       |
| admission_date | date        | NO   |     | NULL    |       |
| cet_no         | int(11)     | NO   |     | NULL    |       |
| faculty_id     | int(10)     | NO   | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.02 sec)

mysql> desc marks;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int(11)     | NO   | PRI | NULL    |       |
| rollno     | int(11)     | NO   | MUL | NULL    |       |
| subject_id | varchar(11) | NO   |     | NULL    |       |
| marks      | int(11)     | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> desc subjects;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| department_id | int(11)     | NO   | MUL | NULL    |       |
| name          | varchar(50) | NO   |     | NULL    |       |
| faculty_id    | int(11)     | NO   | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql>  alter table marks modify marks float;
Query OK, 40 rows affected (0.06 sec)
Records: 40  Duplicates: 0  Warnings: 0

mysql> alter table marks add grade varchar(2) default 'A';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update marks set grade='O' where marks>=90;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> update marks set grade='A+' where marks>=80 and marks<90;
Query OK, 8 rows affected (0.00 sec)
Rows matched: 8  Changed: 8  Warnings: 0

mysql> update marks set grade='A' where marks>=70 and marks<80;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 5  Changed: 0  Warnings: 0

mysql> update marks set grade='B' where marks>=60 and marks<70;
Query OK, 5 rows affected (0.00 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> update marks set grade='B+' where marks>=50 and marks<60;
Query OK, 4 rows affected (0.00 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> update marks set grade='C' where marks>=40 and marks<50;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> update marks set grade='F' where marks<35;select max(marks) from marks;
Query OK, 8 rows affected (0.01 sec)
Rows matched: 8  Changed: 8  Warnings: 0

+------------+
| max(marks) |
+------------+
|        100 |
+------------+
1 row in set (0.00 sec)

mysql> select marks from marks group by marks having count(*)>3;
+-------+
| marks |
+-------+
|    80 |
+-------+
1 row in set (0.00 sec)

mysql>  select name from students order by name;
+------------+
| name       |
+------------+
| Aashay     |
| Abdulah    |
| adnan      |
| Adwait     |
| altaf      |
| aqib       |
| Atharva    |
| azhar      |
| daniel     |
| faraz      |
| fazle      |
| hannan     |
| jadav      |
| john       |
| kamil      |
| kouser     |
| mannan     |
| mazhar     |
| mehboob    |
| mohsin     |
| panda      |
| Rashmi     |
| Reddy      |
| Saaim      |
| Sagar      |
| samad      |
| Shaiz      |
| Shanaz     |
| Sharanya   |
| Shivam     |
| Shreya     |
| sikandar   |
| Smitha     |
| sukhvinder |
| Sunanda    |
| Sundara    |
| Vinod      |
| zahid      |
| zaid       |
| zuhair     |
+------------+
40 rows in set (0.00 sec)

mysql>  select name,marks from students s join marks m on s.rollno=m.rollno;
+------------+-------+
| name       | marks |
+------------+-------+
| Vinod      |    80 |
| Adwait     |    70 |
| Aashay     |    90 |
| Atharva    |    80 |
| Rashmi     |    80 |
| Shivam     |    80 |
| Sunanda    |    90 |
| Sagar      |    80 |
| Shreya     |    70 |
| hannan     |    73 |
| adnan      |     0 |
| zaid       |    21 |
| mehboob    |    23 |
| Abdulah    |    35 |
| jadav      |    81 |
| Shanaz     |    85 |
| Sundara    |    65 |
| Sharanya   |    56 |
| Smitha     |    23 |
| Reddy      |    12 |
| altaf      |    23 |
| sikandar   |    56 |
| sukhvinder |    67 |
| samad      |    78 |
| faraz      |    56 |
| Saaim      |    46 |
| fazle      |    57 |
| mohsin     |    15 |
| Shaiz      |    35 |
| mannan     |    99 |
| aqib       |    43 |
| mazhar     |    66 |
| azhar      |    77 |
| zuhair     |    38 |
| kamil      |    26 |
| john       |    46 |
| daniel     |    67 |
| panda      |    85 |
| kouser     |    65 |
| zahid      |   100 |
+------------+-------+
40 rows in set (0.00 sec)

mysql> CREATE TRIGGER `delete_student` BEFORE DELETE ON `students` FOR EACH ROW DELETE FROM marks WHERE rollno = OLD.rollno;
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE calculate_pointer(IN roll_num INT, IN date INT, OUT pointer int)
    -> BEGIN
    -> SELECT avg(marks.marks) INTO pointer
    ->
    -> FROM marks JOIN subjects ON marks.subject_id = subjects.id
    ->
    -> WHERE marks.rollno = rollno
    -> AND marks.subject_id IN (SELECT subjects.id FROM subjects, students
    -> WHERE subjects.department_id = students.department_id
    -> AND students.roll_num = roll_num);
    ->
    -> END $$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;