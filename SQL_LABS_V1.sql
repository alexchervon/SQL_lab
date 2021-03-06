﻿  CREATE SEQUENCE MYSQEMA2 START WITH 1 INCREMENT BY 1 MAXVALUE 6
    CREATE SEQUENCE MYSQEMA3 START WITH 1 INCREMENT BY 1 MAXVALUE 6
      CREATE SEQUENCE MYSQEMA4 START WITH 1 INCREMENT BY 1 MAXVALUE 6
        CREATE SEQUENCE MYSQEMA5 START WITH 1 INCREMENT BY 1 MAXVALUE 6
          CREATE SEQUENCE MYSQEMA6 START WITH 1 INCREMENT BY 1 MAXVALUE 6
            CREATE SEQUENCE MYSQEMA7 START WITH 1 INCREMENT BY 1 MAXVALUE 6
              CREATE SEQUENCE MYSQEMA8 START WITH 1 INCREMENT BY 1 MAXVALUE 6
                CREATE SEQUENCE MYSQEMA9 START WITH 1 INCREMENT BY 1 MAXVALUE 6
                  CREATE SEQUENCE MYSQEMA10 START WITH 1 INCREMENT BY 1 MAXVALUE 6
                   CREATE SEQUENCE MYSQEMA11 START WITH 1 INCREMENT BY 1 MAXVALUE 6
 

  INSERT INTO T_CATERER VALUES (NEXT VALUE FOR MYSQEMA1,'JOHN','PERM','+709235982325','98235723') 
  INSERT INTO T_EMPLOYER VALUES (NEXT VALUE FOR MYSQEMA2,'JOHN','DOE','ENGLISH'),
  (NEXT VALUE FOR MYSQEMA2,'JOHN','DOE','ENGLISH'),
  (NEXT VALUE FOR MYSQEMA2,'JOHN','DOE','ENGLISH') ,
  (NEXT VALUE FOR MYSQEMA2,'JOHN','DOE','ENGLISH') ,
  (NEXT VALUE FOR MYSQEMA2,'JOHN','DOE','ENGLISH')

   INSERT INTO T_SECTION VALUES (NEXT VALUE FOR MYSQEMA3,'JOHN',1),
  (NEXT VALUE FOR MYSQEMA3,'JOHN',1),
  (NEXT VALUE FOR MYSQEMA3,'JOHN',1) ,
  (NEXT VALUE FOR MYSQEMA3,'JOHN',1) ,
  (NEXT VALUE FOR MYSQEMA3,'JOHN',1)

   INSERT INTO T_GROUP VALUES (NEXT VALUE FOR MYSQEMA6,'name USERDATA'),
   (NEXT VALUE FOR MYSQEMA6,'name USERDATA'),
   (NEXT VALUE FOR MYSQEMA6,'name USERDATA'),
   (NEXT VALUE FOR MYSQEMA6,'name USERDATA'),
   (NEXT VALUE FOR MYSQEMA6,'name USERDATA')

   INSERT INTO T_MESSURE VALUES (NEXT VALUE FOR MYSQEMA9,'USERDATA_2'),
    (NEXT VALUE FOR MYSQEMA9,'USERDATA_2'),
    (NEXT VALUE FOR MYSQEMA9,'USERDATA_2'),
    (NEXT VALUE FOR MYSQEMA9,'USERDATA_2'),
    (NEXT VALUE FOR MYSQEMA9,'USERDATA_2')

  
   INSERT INTO T_MATERIAL VALUES (NEXT VALUE FOR MYSQEMA11,'USERDATA_2',1,2),
    (NEXT VALUE FOR MYSQEMA11,'USERDATA_2',1,2),
    (NEXT VALUE FOR MYSQEMA11,'USERDATA_2',1,2),
    (NEXT VALUE FOR MYSQEMA11,'USERDATA_2',1,2),
    (NEXT VALUE FOR MYSQEMA11,'USERDATA_2',1,2)

  INSERT INTO T_STORE VALUES (NEXT VALUE FOR MYSQEMA12,'WOW'),
    (NEXT VALUE FOR MYSQEMA12,'WOW'),
    (NEXT VALUE FOR MYSQEMA12,'WOW'),
    (NEXT VALUE FOR MYSQEMA12,'WOW'),
    (NEXT VALUE FOR MYSQEMA12,'WOW')

    INSERT INTO T_SUPPLY VALUES (NEXT VALUE FOR MYSQEMA13,2,1,1,'2012-01-05',325),
    (NEXT VALUE FOR MYSQEMA13,2,1,1,'2012-01-05',325),
    (NEXT VALUE FOR MYSQEMA13,2,1,1,'2012-01-05',325),
    (NEXT VALUE FOR MYSQEMA13,2,1,1,'2012-01-05',325),
    (NEXT VALUE FOR MYSQEMA13,2,1,1,'2012-01-05',325)

  INSERT INTO T_SURPLUS VALUES (1,1,235),(1,1,235),(1,1,235),(1,1,235),(1,1,235)

   INSERT INTO T_DELIVER VALUES (NEXT VALUE FOR MYSQEMA14,1,1,1,'2012-01-05'),
    (NEXT VALUE FOR MYSQEMA14,1,1,1,'2012-01-05'),
    (NEXT VALUE FOR MYSQEMA14,1,1,1,'2012-01-05'),
    (NEXT VALUE FOR MYSQEMA14,1,1,1,'2012-01-05'),
    (NEXT VALUE FOR MYSQEMA14,1,1,1,'2012-01-05')

   INSERT INTO T_INPRICE VALUES (NEXT VALUE FOR MYSQEMA15,35,345),
    (NEXT VALUE FOR MYSQEMA15,35,345),
    (NEXT VALUE FOR MYSQEMA15,35,345),
    (NEXT VALUE FOR MYSQEMA15,35,345),
    (NEXT VALUE FOR MYSQEMA15,35,345)

  DELETE FROM T_INPRICE WHERE PRICE_DATE<'31.12.2000'

  DELETE FROM T_MESSURE WHERE NAME LIKE '_'

  UPDATE T_SURPLUS SET VOLUME = 0 WHERE ID_STORE=1

  UPDATE T_EMPLOYER SET birthdate = '12.04.2012',marriage='male' WHERE ID_EMPLOYER = 1

  UPDATE T_CATERER SET PHONE = '+723052352253' WHERE ID_CATERER =1
    
  UPDATE T_INPRICE SET PRICE = PRICE-((PRICE * 15)/100) WHERE PRICE_DATE LIKE '%2018%'

*/

/*

//ЗАДАНИЕ 14 
SELECT * FROM T_CATERER   


//ЗАДАНИЕ 15
SELECT NAME,ID_MESSURE,ID_GROUP FROM T_MATERIAL WHERE 1


//ЗАДАНИЕ 16
SELECT NAME,SURNAME,birtdate,FATHER_NAME FROM T_EMPLOYER WHERE 1


//ЗАДАНИЕ 17
SELECT * FROM T_EMPLOYER WHERE SEX <> 'W'

//ЗАДАНИЕ 18
SELECT * FROM T_CATERER WHERE ID_CATERER IN (SELECT ID_CATERER FROM T_SUPPLY WHERE SUPPLE_DATE >= '01.04.2009' AND SUPPLE_DATE <='01.07.2009')

//ЗАДАНИЕ 19
SELECT * FROM T_DELIVER WHERE ID_MATERIAL IN (SELECT ID_MATERIAL FROM T_SECTION) AND T_DELIVER.DELIVER_DADE >= '01.09.2009' AND T_DELIVER.DELIVER_DADE <= '30.09.2009'

//ЗАДАНИЕ 20
SELECT * FROM T_SECTION WHERE ID_SECTION IN (SELECT T_DELIVER.ID_SECTION FROM T_DELIVER WHERE T_DELIVER.DELIVER_DADE = SYSDATETIME())

//ЗАДАНИЕ 21
SELECT NAME FROM T_MATERIAL WHERE ID_MATERIAL IN (SELECT ID_MATERIAL FROM T_SUPPLY WHERE SUPPLE_DATE = SYSDATE)


//ЗАДАНИЕ 22
SELECT NAME FROM T_MATERIAL  WHERE ID_MATERIAL IN (SELECT ID_MATERIAL FROM T_SUPPLY WHERE SUPPLE_DATE = SYSDATE) AND ID_MATERIAL IN (SELECT ID_MATERIAL FROM T_SURPLUS WHERE VOLUME= 0)


//СОЗДАНИЕ ТАБЛИЦЫ С ДОЛЖНОСТЯМИ
CREATE TABLE T_POSTS (
   ID_POST INT NOT NULL,
   ID_EMPLOYER INT NOT NULL REFERENCES T_EMPLOYER(ID_EMPLOYER)
)


//ЗАДАНИЕ 23
SELECT DISTINCT T_EMPLOYER.NAME,T_EMPLOYER.FATHER_NAME,T_EMPLOYER.SURNAME,T_SECTION.ID_SECTION,T_SECTION.NAME FROM T_SECTION LEFT JOIN T_EMPLOYER ON (T_SECTION.ID_EMPLOYER=T_EMPLOYER.ID_EMPLOYER) WHERE T_EMPLOYER.ID_EMPLOYER=T_SECTION.ID_EMPLOYER


//ЗАДАНИЕ 24
SELECT DISTINCT T_POSTS.NAME, T_EMPLOYER.NAME,T_EMPLOYER.FATHER_NAME,T_EMPLOYER.SURNAME,T_SECTION.ID_SECTION,T_SECTION.NAME FROM T_SECTION LEFT JOIN T_EMPLOYER ON (T_SECTION.ID_EMPLOYER=T_EMPLOYER.ID_EMPLOYER) LEFT JOIN T_POSTS ON (T_EMPLOYER.ID_EMPLOYER=T_POSTS.ID_POST) WHERE T_EMPLOYER.ID_EMPLOYER=T_SECTION.ID_EMPLOYER


//ЗАДАНИЕ 25
SELECT DISTINCT T_CATERER.NAME,T_SUPPLY.VOLUME,T_INPRICE.PRICE,T_SUPPLY.SUPPLE_DATE FROM T_CATERER,T_MATERIAL,T_SUPPLY,T_INPRICE,T_SURPLUS WHERE T_SUPPLY.SUPPLE_DATE >='01.01.2009' AND T_SUPPLY.SUPPLE_DATE<='01.04.2009'


//ЗАДАНИЕ 26
SELECT DISTINCT T_CATERER.NAME,T_SUPPLY.VOLUME,T_INPRICE.PRICE,T_SUPPLY.SUPPLE_DATE FROM T_CATERER,T_MATERIAL,T_SUPPLY,T_INPRICE,T_SURPLUS WHERE T_SUPPLY.SUPPLE_DATE >='01.01.2009' AND T_SUPPLY.SUPPLE_DATE<='01.04.2009' AND T_CATERER.UR_ADDRESS = 'ПЕРМЬ'


//ЗАДАНИЕ 27
SELECT T_MATERIAL.ID_MATERIAL,T_MATERIAL.NAME,T_MATERIAL.ID_MESSURE,T_MATERIAL.ID_GROUP,T_SURPLUS.VOLUME,T_STORE.ID_STORE FROM dbo.T_SURPLUS INNER JOIN dbo.T_MATERIAL ON T_SURPLUS.ID_MATERIAL = T_MATERIAL.ID_MATERIAL INNER JOIN dbo.T_STORE ON T_SURPLUS.ID_STORE = T_STORE.ID_STORE


//ЗАДАНИЕ 28
SELECT T_CATERER.* ,T_MATERIAL.NAME ,T_INPRICE.PRICE ,T_SUPPLY.VOLUME, T_SUPPLY.SUPPLE_DATE FROM dbo.T_INPRICE INNER JOIN dbo.T_MATERIAL ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL INNER JOIN dbo.T_SUPPLY ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL T_CATERER ON T_SUPPLY.ID_CARTER = T_CATERER.ID_CATERER WHERE T_SUPPLY.SUPPLE_DATE => '01.01.2009' AND T_SUPPLY.SUPPLE_DATE <= '01.03.2009'


//ЗАДАНИЕ 29
SELECT T_CATERER.* ,T_MATERIAL.NAME ,T_INPRICE.PRICE ,T_SUPPLY.VOLUME, T_SUPPLY.SUPPLE_DATE FROM dbo.T_INPRICE INNER JOIN dbo.T_MATERIAL ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL INNER JOIN dbo.T_SUPPLY ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL T_CATERER ON T_SUPPLY.ID_CARTER = T_CATERER.ID_CATERER WHERE T_SUPPLY.SUPPLE_DATE => '01.01.2009' AND T_SUPPLY.SUPPLE_DATE <= '01.03.2009' AND T_CATERER.ID_CATERER=T_SUPPLY.ID_CARTER


//ЗАДАНИЕ 30 лет я женат на левой руке
SELECT T_STORE.* ,T_MATERIAL.NAME ,T_SURPLUS.VOLUME FROM dbo.T_SURPLUS INNER JOIN dbo.T_STORE ON T_SURPLUS.ID_STORE = T_STORE.ID_STORE INNER JOIN dbo.T_MATERIAL ON T_SURPLUS.ID_MATERIAL = T_MATERIAL.ID_MATERIAL


//ЗАДАНИЕ 31
SELECT T_MATERIAL.* ,T_MESSURE.* ,T_INPRICE.PRICE FROM dbo.T_MATERIAL INNER JOIN dbo.T_MESSURE ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE INNER JOIN dbo.T_INPRICE ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_INPRICE.PRICE_DATE >='01.03.2009' AND T_INPRICE.PRICE_DATE <= '01.06.2009'


//ЗАДАНИЕ 32
SELECT T_MATERIAL.* ,T_MESSURE.* ,T_INPRICE.PRICE FROM dbo.T_MATERIAL INNER JOIN dbo.T_MESSURE ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE INNER JOIN dbo.T_INPRICE ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_INPRICE.PRICE_DATE >= '01.01.0001'


//ЗАДАНИЕ 33
ALTER TABLE T_EMPLOYER ADD ID_MANAGER INT


//ЗАДАНИЕ 34
UPDATE T_EMPLOYER SET ID_MANAGER = 1 WHERE ID_EMPLOYER =1
  UPDATE T_EMPLOYER SET ID_MANAGER = 1 WHERE ID_EMPLOYER =3
    UPDATE T_EMPLOYER SET ID_MANAGER = 1 WHERE ID_EMPLOYER =5


//ЗАДАНИЕ 35  
SELECT T_MATERIAL.* ,T_GROUP.NAME_GROUP FROM dbo.T_MATERIAL INNER JOIN dbo.T_GROUP ON T_MATERIAL.ID_GROUP = T_GROUP.ID_GROUP

//СОЗДАЛ ТАБЛИЦУ EXEMP

//ЗАДАНИЕ 36
ALTER TABLE T_EXEMP ADD DISMISSED DATE

//ЗАДАНИЕ 37

 CREATE TABLE T_CONTACT (
 ID_CONTACT INT PRIMARY KEY NOT NULL,
 ID_CATERER INT REFERENCES T_CATERER(ID_CATERER),
 FIRST_NAME NVARCHAR(255) NOT NULL,
 LAST_NAME NVARCHAR(255) NOT NULL,
 PATRONYMIC NVARCHAR(255) NOT NULL,
 PHONE NVARCHAR(255) NOT NULL, 
 )

//ЗАДАНИЕ 37
SELECT T_CONTACT.FIRST_NAME AS 'ПОСТАВЩИКИ' ,T_CONTACT.LAST_NAME,T_CONTACT.PATRONYMIC,T_CONTACT.PHONE FROM dbo.T_CONTACT INNER JOIN dbo.T_CATERER ON T_CONTACT.ID_CATERER = T_CATERER.ID_CATERER
UNION
SELECT T_CONTACT.FIRST_NAME AS 'СОТРУДНИКИ',T_CONTACT.LAST_NAME,PATRONYMIC,PHONE FROM T_CONTACT WHERE ID_EMPLOYER<>NULL

//ЗАДАНИЕ 38  
SELECT * FROM T_CATERER ORDER BY NAME

//ЗАДАНИЕ 39
SELECT T_CONTACT.FIRST_NAME ,T_CONTACT.LAST_NAME,T_CONTACT.PATRONYMIC,T_CONTACT.PHONE FROM dbo.T_CONTACT INNER JOIN dbo.T_CATERER ON T_CONTACT.ID_CATERER = T_CATERER.ID_CATERER ORDER BY T_CATERER.NAME

SELECT T_CONTACT.FIRST_NAME AS 'ПОСТАВЩИКИ' ,T_CONTACT.LAST_NAME,T_CONTACT.PATRONYMIC,T_CONTACT.PHONE FROM dbo.T_CONTACT INNER JOIN dbo.T_CATERER ON T_CONTACT.ID_CATERER = T_CATERER.ID_CATERER ORDER BY T_CONTACT.NAME,T_CONTACT.PATRONYMIC


//ЗАДАНИЕ 40
SELECT T_MATERIAL.NAME ,T_STORE.NAME,T_SUPPLY.VOLUME FROM dbo.T_SUPPLY INNER JOIN dbo.T_STORE ON T_SUPPLY.ID_STORE = T_STORE.ID_STORE INNER JOIN dbo.T_MATERIAL ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL ORDER BY T_STORE.NAME, T_SUPPLY.VOLUME DESC


//ЗАДАНИЕ 41
SELECT T_MATERIAL.NAME, COUNT(T_SUPPLY.VOLUME) AS 'ОБЪЕМ ПОСТАВОК' FROM dbo.T_SUPPLY INNER JOIN dbo.T_MATERIAL ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE SUPPLE_DATE LIKE '%2018%' GROUP BY NAME ORDER BY (SELECT ID_DELIVER FROM T_DELIVER)

//ЗАДАНИЕ 42
SELECT T_MATERIAL.NAME,AVG(T_INPRICE.PRICE) AS 'СРЕДНЯЯ ЦЕНА ПОСТАВКИ' FROM dbo.T_INPRICE INNER JOIN dbo.T_MATERIAL ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL GROUP BY NAME

//ЗАДАНИЕ 43 
SELECT COUNT(T_DELIVER.ID_MATERIAL) FROM dbo.T_DELIVER INNER JOIN dbo.T_MATERIAL ON T_DELIVER.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_DELIVER.DELIVER_DADE LIKE '%2018%'

//ЗАДАНИЕ 44
SELECT AVG(T_INPRICE.PRICE) AS 'Средняя цена поставки' FROM dbo.T_INPRICE INNER JOIN dbo.T_MATERIAL ON dbo.T_INPRICE.ID_MATERIAL = dbo.T_MATERIAL.ID_MATERIAL UNION SELECT SUM(dbo.T_SUPPLY.VOLUME) as 'Остатки' FROM T_SUPPLY INNER JOIN  dbo.T_MATERIAL ON dbo.T_MATERIAL.ID_MATERIAL= dbo.T_SUPPLY.ID_MATERIAL GROUP BY NAME

//ЗАДАНИЕ 45
SELECT T_STORE.NAME FROM dbo.T_SUPPLY INNER JOIN dbo.T_STORE ON T_SUPPLY.ID_STORE = T_STORE.ID_STORE INNER JOIN dbo.T_MATERIAL ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_MATERIAL.ID_MATERIAL = T_SUPPLY.ID_MATERIAL AND T_SUPPLY.VOLUME = 0

//ЗАДАНИЕ 46
SELECT T_CATERER.NAME,T_CATERER.PHONE,T_CATERER.FAX,T_CATERER.UR_ADDRESS FROM dbo.T_SUPPLY INNER JOIN dbo.T_CATERER ON T_SUPPLY.ID_CARTER = T_CATERER.ID_CATERER INNER JOIN dbo.T_MATERIAL ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_SUPPLY.SUPPLE_DATE LIKE '%2009%' AND T_SUPPLY.VOLUME < 1000

//ЗАДАНИЕ 47
SELECT T_CATERER.NAME,T_CATERER.PHONE,T_CATERER.FAX,T_CATERER.UR_ADDRESS FROM dbo.T_SUPPLY INNER JOIN dbo.T_CATERER ON T_SUPPLY.ID_CARTER = T_CATERER.ID_CATERER INNER JOIN dbo.T_MATERIAL ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL WHERE T_SUPPLY.SUPPLE_DATE LIKE '%2009%' AND T_CATERER.ID_CATERER IN (SELECT MAX(T_CATERER.ID_CATERER) FROM T_CATERER INNER JOIN T_SUPPLY ON T_CATERER.ID_CATERER=T_SUPPLY.ID_CARTER)


//ЗАДАНИЕ 48
CREATE VIEW "list_caterer" (name,contact) AS SELECT NAME,FIRST_NAME FROM dbo.T_CONTACT INNER JOIN dbo.T_CATERER ON T_CONTACT.ID_CATERER = T_CATERER.ID_CATERER
  ОПЕРАЦИИ:
  -- SELECT * FROM dbo.LIST_CATERER ORDER BY contact
  -- INSERT INTO list_caterer VALUES('top','check') - ЭТО БЫ РАБОТАЛО, ЕСЛИ НЕБЫЛО ЗАВИСИМОСТЕЙ
  -- UPDATE list_caterer SET name = 'kek' - НА ДВЕ СТРОКИ СРАБОТАЕТ

//ЗАДАНИЕ 49
CREATE VIEW "sum_ost" AS SELECT T_MATERIAL.NAME AS 'МАТЕРИАЛ' ,SUM(T_SURPLUS.VOLUME) AS 'ОСТАТОК' FROM dbo.T_SURPLUS INNER JOIN dbo.T_MATERIAL ON T_SURPLUS.ID_MATERIAL = T_MATERIAL.ID_MATERIAL INNER JOIN dbo.T_STORE ON T_SURPLUS.ID_STORE = T_STORE.ID_STORE GROUP BY T_MATERIAL.NAME

//ЗАДАНИЕ 50
CREATE VIEW "51" (name,met_name,ost_name,dostavka,price,countPrice,summa) AS
SELECT DISTINCT T_CATERER.NAME ,T_MATERIAL.NAME,T_MESSURE.NAME,T_DELIVER.DELIVER_DADE,T_INPRICE.PRICE,COUNT(T_MATERIAL.ID_MATERIAL) AS 'КОЛ-ВО МАТЕРИАЛОВ', SUM(T_INPRICE.PRICE) AS 'СУММА ДОСТАВОК' FROM dbo.T_DELIVER
    INNER JOIN dbo.T_MATERIAL
      ON T_DELIVER.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
    INNER JOIN dbo.T_SUPPLY
      ON T_SUPPLY.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
    INNER JOIN dbo.T_CATERER
      ON T_SUPPLY.ID_CARTER = T_CATERER.ID_CATERER
    INNER JOIN dbo.T_INPRICE
      ON T_INPRICE.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
    INNER JOIN dbo.T_MESSURE
      ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE
        GROUP BY T_CATERER.NAME,T_MATERIAL.NAME,T_MESSURE.NAME,T_DELIVER.DELIVER_DADE,T_INPRICE.PRICE

//ЗАДАНИЕ 51
  CREATE VIEW "zadanie51" (material,mesure,store,count) AS
    SELECT
        T_MATERIAL.NAME AS 'На-ем материалов' ,T_MESSURE.NAME AS 'На-ем ед измерения' ,T_STORE.NAME AS 'Наз-ие магазинов' ,COUNT(*) AS 'Кол-во материалов за текущий год'
          FROM dbo.T_MATERIAL
              INNER JOIN dbo.T_MESSURE
                ON T_MATERIAL.ID_MESSURE = T_MESSURE.ID_MESSURE
                  INNER JOIN dbo.T_DELIVER
                    ON T_DELIVER.ID_MATERIAL = T_MATERIAL.ID_MATERIAL
                      INNER JOIN dbo.T_STORE
                        ON T_DELIVER.ID_STORE = T_STORE.ID_STORE
                          GROUP BY T_MATERIAL.NAME,T_MESSURE.NAME,T_STORE.NAME,T_MATERIAL.ID_MATERIAL,T_DELIVER.ID_MATERIAL HAVING T_MATERIAL.ID_MATERIAL = T_DELIVER.ID_MATERIAL


//ТАБЛЦИА 1

CREATE TABLE SamWork.dbo.table1 (
  DEPTNO INT NULL
 ,DNAME NVARCHAR(14) NOT NULL
 ,LOC NVARCHAR(13) NOT NULL
);

// ТАБЛИЦА 2

CREATE TABLE SamWork.dbo.table2 (
  EMPNO INT IDENTITY
 ,ENAME NVARCHAR(10) NULL
 ,JOB NVARCHAR(9) NULL
 ,MGR INT NULL
 ,HIREDATE DATE NULL
 ,SAL FLOAT NULL
 ,COMM FLOAT NULL
 ,DEPTNO INT NULL
 ,CONSTRAINT PK_table2_EMPNO PRIMARY KEY CLUSTERED (EMPNO)
);

// ТАБЛИЦА 3

CREATE TABLE SamWork.dbo.SALGRADE (
  GRADE INT NULL
 ,LOSAL INT NULL
 ,HISAL INT NULL
);

INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');


INSERT INTO SALGRADE VALUES(1,700,1200);
INSERT INTO SALGRADE VALUES(1,1201,1400);
INSERT INTO SALGRADE VALUES(1,1401,2000);
INSERT INTO SALGRADE VALUES(1,2001,3000);
INSERT INTO SALGRADE VALUES(1,3001,9999);


Select * into DEPT_COPY  from  DEPT 

//PRIMARY DEPT_COPY
  CONSTRAINT PK_DEPT_COPY_DEPTNO PRIMARY KEY CLUSTERED (DEPTNO)

//REFER
ALTER TABLE SamWork.dbo.EMP
ADD FOREIGN KEY (DEPTNO) REFERENCES dbo.DEPT_COPY (DEPTNO)

// ДЕЛЕТ ПЕРВИЧНЫЙ 
  ALTER TABLE EMP DROP CONSTRAINT PK_table2_EMPNO

  INSERT INTO EMP VALUES(7369,'SMITH', 'CLERK',7902,'17.12.1980',800,NULL,20);
    INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'20.02.1981',1600,300,30);
    INSERT INTO EMP VALUES(7521,'WARD','SALESMAN', 7698,'22.02.1981', 1250,500,30);
      INSERT INTO EMP VALUES(7566,'JONES', 'MANAGER',7839,'02.04.1981', '2975',NULL,20);
    INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698, '28.09.1981', 1250,1400,30);
  
    INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839 ,'09.06.1981', 2450,NULL,10);
     INSERT INTO EMP VALUES(7788,'SCOTT', 'ANALYST', 7566,'19.04.1987', 3000,NULL,20);
     INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN', 7698,'08.09.1981', 1500,0,30);

//10
  INSERT INTO EMP(EMPNO) VALUES(14124124)
  INSERT INTO EMP(ENAME) VALUES('TEST')
  INSERT INTO EMP(JOB) SELECT JOB FROM EMP WHERE ENAME = 'TURNER'
  INSERT INTO EMP(MGR) SELECT ENAME FROM EMP WHERE ENAME = 'KING'
  INSERT INTO EMP(HIREDATE) VALUES(SYSDATETIME()-10)
  INSERT INTO EMP(SAL) SELECT AVG(LOSAL+HISAL) FROM SALGRADE WHERE GRADE = 1

  INSERT INTO EMP(DEPTNO) SELECT EMP.DEPTNO FROM dbo.EMP INNER JOIN dbo.DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE DEPT.DNAME = 'DALAS'

UPDATE EMP SET SAL = CASE WHEN SAL<(SELECT HISAL FROM SALGRADE) THEN SAL+(SAL*0.4) ELSE (SELECT HISAL FROM SALGRADE) END WHERE DEPTNO = (SELECT DEPTNO FROM DEPT)

UPDATE EMP SET DEPTNO = CASE WHEN MGR = (SELECT MGR FORM EMP WHERE ENAME = 'TURNER') THEN MGR ELSE '7698' END WHERE MGR = (SELECT MGR FROM EMP WHERE ENAME='FORD')

DELETE FROM EMP WHERE MGR = (SELECT MGR FROM EMP WHERE ENAME='FORD')


