CREATE TABLE EMPY
       (EMPNO int ,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR int,
        HIREDATE date,
        SAL int,
        COMM int,
        DEPTNO int,
        GRADE int);


INSERT INTO EMPY VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        CAST('1980-12-17' as DATE),  800, NULL, 20, 5);
INSERT INTO EMPY VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        CAST('1981-02-20' as DATE), 1600,  300, 30, 3);
INSERT INTO EMPY VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        CAST('1981-02-22' as DATE), 1250,  500, 30, 4);
INSERT INTO EMPY VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        CAST('1981-04-02' as DATE),  2975, NULL, 20, 2);
INSERT INTO EMPY VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        CAST('1981-09-28' as DATE), 1250, 1400, 30, 4);
INSERT INTO EMPY VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        CAST('1981-05-01' as DATE),  2850, NULL, 30, 2);
INSERT INTO EMPY VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        CAST('1981-06-09' as DATE),  2450, NULL, 10, 2);
INSERT INTO EMPY VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        CAST('1982-12-09' as DATE), 3000, NULL, 20, 1);
INSERT INTO EMPY VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        CAST('1981-11-17' as DATE), 5000, NULL, 10, 1);
INSERT INTO EMPY VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        CAST('1981-09-08' as DATE),  1500, NULL, 30, 3);
INSERT INTO EMPY VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        CAST('1983-01-12' as DATE), 1100, NULL, 20, 4);
INSERT INTO EMPY VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        CAST('1981-12-03' as DATE),   950, NULL, 30, 5);

INSERT INTO EMPY VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        CAST('1981-12-03' as DATE),  3000, NULL, 20, 1);
INSERT INTO EMPY VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        CAST('1982-01-23' as DATE), 1300, NULL, 10, 3);

CREATE TABLE DEPT
       (DEPTNO INT,
        DNAME VARCHAR(14),
        LOC VARCHAR(13) );


INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

select * from DEPT
select * from EMPY

--1> Display all the information of the EMP table?
select * from EMPY

--2>Display unique Jobs from EMP table?
select distinct(job) from empy

--3>List the emps in the asc order of their Salaries?
select * from EMPY
	Order by SAL

--4>List the details of the emps in asc order of the Dptnos and desc of Jobs? 
select * from EMPY
	Order by DEPTNO asc, job desc

--5>Display all the unique job groups in the descending order? 
select distinct(job) from empy
	order by JOB desc

--6>Display all the details of all ‘Mgrs’
select * from EMPY E join DEPT D on E.DEPTNO=D.DEPTNO

--7>List the emps who joined before 1981.
select * from EMPY 
where HIREDATE>='1981'

--8>List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select empno,ename,sal from EMPY order by sal asc

--9>Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT empno,ename,Job,hiredate,DATEDIFF(YEAR, hiredate, GETDATE()) AS Experience from EMPY

--10>List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT EMPNO,ENAME,SAL,DATEDIFF(YEAR, HIREDATE, GETDATE()) AS Experience from EMPY where EMPNO = 7369

--11>Display all the details of the emps whose Comm. Is more than their Sal.
select * from EMPY where SAL < COMM

--12>List the emps in the asc order of Designations of those joined after the second half of 1981.
select * from EMPY where HIREDATE>'1981-06-30' order by JOB asc

--13>List the emps along with their Exp and Daily Sal is more than Rs.100.
SELECT Empno,Ename,DATEDIFF(YEAR, Hiredate, GETDATE()) AS Experience,SAL / 365 AS Daily_Salar FROM EMPY
where(SAL / 365) > 100

--14>List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * from EMPY where job in ('Clerk','Analyst')

--15>List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
select * from empy where HIREDATE in ('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80')

--16>List the emp who are working for the Deptno 10 or20.
select * from EMPY where DEPTNO in ('10','20')

--17>List the emps who are joined in the year 81.
select * from EMPY where year(HIREDATE) ='1981'

--18>List the emps who are joined in the month of Aug 1980.
select * from EMPY where HIREDATE between '1980-08-01'and '1980-08-30'

--19>List the emps Who Annual sal ranging from 22000 and 45000.
select * from EMPY WHERE (SAL * 12) BETWEEN 22000 AND 45000

--20>List the Enames those are having five characters in their Names.
select * from EMPY where len(ENAME)='5'

--21>List the Enames those are starting with ‘S’ and with five characters.
select * from EMPY where LEFT(ENAME,1) = 'S'

--22>List the emps those are having four chars and third character must be ‘r’.
select * from EMPY where len(ENAME)='4' and SUBSTRING(ENAME, 3, 1) = 'R';

--23>List the Five character names starting with ‘S’ and ending with ‘H’.
select * from EMPY where len(ENAME)='4' and LEFT(ENAME,1) = 'S' and right(ENAME,1) = 'H'

--24>List the emps who joined in January.
select * from EMPY where Month(Hiredate) = '1'

--25>List the emps who joined in the month of which second character is ‘a’.
select *,DATENAME(month,hiredate) from EMPY where DATENAME(month,hiredate) like ('_a%')

--26>List the emps whose Sal is four digit number ending with Zero.
SELECT * FROM EMPY WHERE SAL BETWEEN 1000 AND 9999 AND SAL % 10 = 0;

--27>List the emps whose names having a character set ‘ll’ together.
SELECT * FROM EMPY WHERE ENAME like '%ll%'

--28>List the emps those who joined in 80’s.
SELECT * FROM EMPY WHERE year(HIREDATE) in ('1980')

--29>List the emps who does not belong to Deptno 20.
SELECT * FROM EMPY WHERE DEPTNO<> '20'

--30>List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
select * from EMPY where job not in ('PRESIDENT','MGR') order by SAL asc

--31>List all the emps who joined before or after 1981.
select * from EMPY where year(HIREDATE) <> 1981

--32>List the emps whose Empno not starting with digit78.
select * from EMPY where EMPNO not like ('78%') order by EMPNO

--33>List the emps who are working under ‘MGR’.
select * from EMPY where JOB = 'Manager'

--34>List the emps who joined in any year but not belongs to the month of March.
select * from EMPY where MONTH(HIREDATE)<> '12'

--35>List all the Clerks of Deptno 20.
select * from EMPY where JOB= 'CLerk' and DEPTNO = 20

--36>List the emps of Deptno 30 or 10 joined in the year 1981.
select * from EMPY where HIREDATE like ('1981%') and DEPTNO in (30,10) order by DEPTNO

--37>Display the details of SMITH.
select * from EMPY where ENAME = 'smith'

--38>Display the location of  SMITH.
select E.*,D.LOC from EMPY E join DEPT D on E.DEPTNO=D.DEPTNO

--39>List the total information of EMP table along with DNAME and Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.
select E.*,D.DNAME,D.LOC from EMPY E join DEPT D on E.DEPTNO=D.DEPTNO where E.JOB in ('Salesman','Clerk') order by E.DEPTNO asc

--40>List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas with an exp more than 7 years without receiving the Comm asc order of Loc.
select E.EMPNO,E.ENAME,E.SAL,D.DNAME from EMPY E join DEPT D on E.DEPTNO=D.DEPTNO where job in ('Manager','Analyst')

--41>Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000,
--but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd
--position in the asc order of Deptno and desc order of job.
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC, E.DEPTNO, E.JOB
FROM EMPY E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE 
    (D.LOC = 'CHICAGO' OR D.DNAME = 'ACCOUNTING')
    AND E.SAL * 12 > 28000
    AND E.SAL NOT IN (2800, 3000)
    AND E.JOB != 'MANAGER'
    AND SUBSTRING(CAST(E.EMPNO AS CHAR), 3, 1) IN ('7', '8')
ORDER BY E.DEPTNO ASC, E.JOB DESC

--42>Display the total information of the emps along with Grades in the asc order.
select * from EMPY order by GRADE

--43>List all the Grade2 and Grade 3 emps.
select * from EMPY where GRADE in (3,4)

--44>Display all Grade 4,5 Analyst and Mgr.
select * from EMPY where GRADE in (4,5) and job in ('ANALYST','MANAGER')

--45>List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept10 or20.
select E.EMPNO,E.ENAME,E.SAL,D.DNAME,E.grade,datediff(year,E.hiredate,getdate()) as exp,E.SAL*12 as annual_sal
from EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO where E.DEPTNO in (10,20) order by E.GRADE

--46>List all the information of emp with Loc and the Grade of all the emps belong to the Grade range 
--from 2 to 4 working at the Dept those are not starting with char set ‘OP’ and not ending with ‘S’ with 
--the designation having a char ‘a’ any where joined in the year 1981
--but not in the month of Mar or Sep and Sal not end with ‘00’ in the asc order of Grades
select E.*,D.LOC from EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
where E.GRADE in (2,4) and E.ENAME not like ('OP%') and E.ENAME not like ('%s') and E.JOB like ('%a%') and year(E.hiredate) = 1981
and MONTH(HIREDATE) not in (3,9) and E.SAL not like ('%00')

--47>List the details of the Depts along with Empno, Ename or without the emps
select E.JOB,E.EMPNO,E.ENAME from EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO

--48>List the details of the emps whose Salaries more than the employee BLAKE.
select * from EMPY where SAL > (select SAL from EMPY where ENAME = 'Blake')

--49>List the emps whose Jobs are same as ALLEN.
select * from EMPY where JOB = (select JOB from EMPY where ENAME = 'Allen')

--50>List the emps who are senior to King.
select * from EMPY where HIREDATE < (select HIREDATE from EMPY where ENAME = 'King')

--51>List the Emps who are senior to their own MGRS.
SELECT * FROM EMPY E WHERE HIREDATE < (SELECT MGR.HIREDATE FROM EMPY MGR WHERE MGR.EMPNO = E.MGR)

--52>List the Emps of Deptno 20 whose Jobs are same as Deptno10.
select * from EMPY where DEPTNO = 20 and job in (select JOB from EMPY where DEPTNO = 30)

--53>List the Emps whose Sal is same as FORD or SMITH in desc order of Sal. 
select * from EMPY where SAL in (select SAL from EMPY where ENAME in ('Ford','Smith')) order by SAL desc

--54>List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
select * from EMPY where JOB = (select job from EMPY where ename = 'Miller') or SAL > (select SAL from EMPY where ENAME = 'Allen')

--55>List the Emps whose Sal is > the total remuneration of the SALESMAN.
select * from EMPY where SAL > (select sum(SAL) from EMPY where JOB = 'Salesman')

--56>List the emps who are senior to BLAKE working at CHICAGO & BOSTON.
select * from EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO where E.HIREDATE > (select HIREDATE from EMPY where ENAME = 'Blake')
and D.LOC in ('CHICAGO','BOSTON')

--57>List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and RESEARCH 
--whose Sal is more than ALLEN and exp more than SMITH in the asc order of EXP.
select * from EMPY where Grade in (3,4) and JOB in ('Accounting','Research') and SAL > (select SAL from EMPY where Ename = 'Allen') 
and hiredate < (select Hiredate from EMPY where Ename = 'Smith')

--58>List the emps whose jobs same as SMITH or ALLEN.
select * from EMPY where JOB in (select JOB from EMPY where ENAME in ('Smith','Allen'))

--59>Write a Query to display the details of emps whose Sal is same as of
--Any jobs of deptno 10 those that are not found in deptno 20.
select * from EMPY where JOB in (select JOB from EMPY where DEPTNO = (10) and DEPTNO !=(20))


-- Create Emp1 Table
CREATE TABLE Emp1 (
    EMPNO INT PRIMARY KEY,           -- Employee Number (Primary Key)
    ENAME VARCHAR(50),               -- Employee Name
    JOB VARCHAR(50),                 -- Job Title
    MANAGER INT,                     -- Manager ID (Self-referencing)
    HIREDATE DATE,                   -- Hire Date
    SAL DECIMAL(10, 2),              -- Salary
    COMM DECIMAL(10, 2),             -- Commission
    DEPTNO INT                       -- Department Number
);

CREATE TABLE Emp2 (
    EMPNO INT PRIMARY KEY,           -- Employee Number (Primary Key)
    ENAME VARCHAR(50),               -- Employee Name
    JOB VARCHAR(50),                 -- Job Title
    MANAGER INT,                     -- Manager ID (References Emp1)
    HIREDATE DATE,                   -- Hire Date
    SAL DECIMAL(10, 2),              -- Salary
    COMM DECIMAL(10, 2),             -- Commission
    DEPTNO INT,                      -- Department Number
    FOREIGN KEY (MANAGER) REFERENCES Emp1(EMPNO)  -- Relationship to Emp1
);


INSERT INTO Emp1 (EMPNO, ENAME, JOB, MANAGER, HIREDATE, SAL, COMM, DEPTNO)
VALUES 
(101, 'John', 'Manager', NULL, '2020-01-15', 75000, NULL, 10),
(102, 'Alice', 'Developer', 101, '2021-03-22', 60000, NULL, 10),
(103, 'Bob', 'Tester', 101, '2021-05-17', 45000, NULL, 20),
(104, 'Diana', 'Developer', 102, '2022-07-01', 65000, 5000, 20);

INSERT INTO Emp2 (EMPNO, ENAME, JOB, MANAGER, HIREDATE, SAL, COMM, DEPTNO)
VALUES 
(201, 'Eve', 'Analyst', 101, '2019-11-10', 80000, NULL, 30),
(202, 'Charlie', 'Analyst', 102, '2020-06-15', 55000, NULL, 30),
(203, 'Grace', 'Clerk', 103, '2021-08-25', 58000, NULL, 40),
(204, 'Frank', 'Clerk', 104, '2022-10-05', 35000, NULL, 40);


--60>List of emps of emp1 who are not found in emp2.
SELECT E1.* FROM Emp1 E1 LEFT JOIN Emp2 E2 ON E1.EMPNO = E2.EMPNO WHERE E2.EMPNO IS NULL

--61>Find the highest sal of EMP table.
select max(sal) from Emp1

--62>Find details of highest paid employee.
select * from Emp1 where SAL = (select max(SAL) from Emp1)

--63>Find the highest paid employee of sales department.
select * from Emp1 where SAL = (select max(SAL) from Emp1 WHERE JOB = 'Salesman') and JOB = 'Salesman'

--64>List the most recently hired emp of grade3 belongs to  location CHICAGO.
select * from EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO where E.HIREDATE = (select MAX(HIREDATE) from EMPY where GRADE = 3) and D.LOC = 'Chichago'

--65>List the employees who are senior to most recently hired employee working under king.
SELECT * FROM EMPY WHERE hiredate > (SELECT MAX(hiredate) FROM EMPY WHERE MGR = (SELECT EMPNO FROM EMPY WHERE ENAME = 'King'))

--66>List the details of the employee belongs to newyork with grade 3 to 5 except ‘PRESIDENT’ 
--whose sal> the highest paid employee of Chicago in a group where there is manager and salesman not working under king
SELECT * FROM EMPY E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO WHERE D.LOC = 'New York' AND E.GRADE BETWEEN 3 AND 5 
AND E.JOB <> 'President'AND (E.SAL > (SELECT MAX(E1.SAL) FROM EMPY E1 INNER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO WHERE D1.LOC = 'Chicago'
AND E1.JOB IN ('Manager', 'Salesman') AND E1.ENAME <> 'KING'))

--67>List the details of the senior employee belongs to 1981.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, GRADE FROM EMPY WHERE YEAR(HIREDATE) = 1981 ORDER BY HIREDATE DESC;

--68>List the employees who joined in 1981 with the job same as the most senior person of the year 1981.
select * from EMPY where year(hiredate)= 1981 and job = (select top 1 job from EMPY where year(hiredate) = 1981 order by HIREDATE asc)

--69>List the most senior empl working under the king and grade is more than 3.
select  Top 1 hiredate as Senior, * from EMPY where MGR = (select EMPNO from EMPY where ENAME = 'king') or GRADE > 3 order by hiredate desc

--70>Find the total sal given to the MGR.
select sum(SAL) as [Total salary of Manager] from EMPY where job = 'Manager'

--71>Find the total annual sal to distribute job wise in the year 81.
select JOB, sum(SAL) Department from EMPY where YEAR(HIREDATE) = 1981 group by JOB order by Department

--72>Display total sal employee belonging to grade 3.
select Grade, sum(sal) from EMPY where grade = 3 group by GRADE

--73>Display the average salaries of all the clerks.
select job, avg(SAL) from EMPY where job = 'clerk' group  by job

--74>List the employeein dept 20 whose sal is >the average sal 0f dept 10 emps.
select * from EMPY where DEPTNO = 20  and sal > (select AVG(sal) from empy where DEPTNO = 10)

--75>Display the number of employee for each job group deptno wise.
select JOB,COUNT(DEPTNO) as Count from EMPY group by job, DEPTNO

--76>List the manager no and the number of employees working for those mgrs in the ascending Mgrno.
select MGR,count(EMPNO) from EMPY group by MGR

--77>List the department,details where at least two emps are working
select D.DNAME,count(EMPNO) Total_count from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO  group by D.DNAME

--78>Display the Grade, Number of emps, and max sal of each grade.
select GRADE, count(EMPNO) as Number_of_emps, max(SAL) as max_sal from EMPY group by GRADE

--79>Display dname, grade, No. of emps where at least two emps are clerks.
select D.DNAME,E.GRADE,count(EMPNO) from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO where E.JOB = 'CLERK'
GROUP BY D.DNAME, E.GRADE HAVING COUNT(E.EMPNO) >= 2;

--80>List the details of the department where maximum number of emps are working.
select TOP 1 D.DNAME,COUNT(E.EMPNO) as Count from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO group by D.DNAME order by Count

--81>Display the emps whose manager name is jones.
select * from EMPY where MGR = (select EMPNO from empy where ENAME = 'JONES')

--82>List the employees whose salary is more than 3000 after giving 20% increment.
select * from EMPY where (sal+(800/20))> 3000 --or
select * from EMPY where sal*1.2> 3000

--83>List the emps with dept names.
select E.*,D.DNAME from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO order by D.DNAME

--84>List the emps who are not working in sales dept.
select E.*,D.DNAME from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO  where D.DNAME<>'Sales' order by D.DNAME

--85>List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago.
select E.ENAME,D.DNAME,E.SAL,E.COMM from EMPY E inner join DEPT D on E.DEPTNO=D.DEPTNO where E.SAL between 2000 and 5000 and D.LOC = 'Chicago'
Order by D.DNAME

--86>List the emps whose sal is greater than his managers salary
select * FROM EMPY E JOIN EMPY M ON E.MGR = M.EMPNO WHERE E.SAL > M.SAL;

--87>List the grade, EMP name for the deptno 10 or deptno 30 but sal grade is not 4 while they joined the company before ’31-dec-82’.
select Grade,Ename,HIREDATE from EMPY where DEPTNO = 10 or DEPTNO = 30 AND GRADE != 4  and HIREDATE < '31-dec-82'

--88>List the name ,job, dname, location for those who are working as MGRS.
select E.Ename,E.JOB FROM EMPY E JOIN DEPT D ON E.DEPTNO = D.DEPTNO where E.JOB = 'MGR'

--89>List the emps whose mgr name is jones and also list their manager name.
SELECT E.EMPNO, E.ENAME AS EMP_NAME, M.ENAME AS MGR_NAME, E.JOB, E.SAL FROM EMPY E JOIN EMPY M ON E.MGR = M.EMPNO WHERE M.ENAME = 'Jones';

--90>List the name and salary of ford if his salary is equal to hisal of his grade.
SELECT ENAME, SAL
FROM EMPY
WHERE ENAME = 'Ford' AND SAL = (SELECT SAL FROM EMPY WHERE GRADE = (SELECT GRADE FROM EMPY WHERE ENAME = 'Ford') LIMIT 1);
--(Didn't understand the question)

--91>Lit the name, job, dname ,sal, grade dept wise
select E.Ename,E.JOB,D.Dname,E.SAL from EMPY E join DEPT D on E.DEPTNO=D.DEPTNO order by sal

--92>List the emp name, job, sal, grade and dname except clerks and sort on the basis of highest sal.
select E.ENAME,E.job,E.grade from EMPY E join DEPt D on E.DEPTNO=D.DEPTNO

--93>List the emps name, job who are with out manager.
select E.ENAME ,E.JOB from EMPY E where E.MGR is null

--94>List the names of the emps who are getting the highest sal dept wise.
SELECT JOB, MAX(SAL) AS MAX_SAL FROM EMPY GROUP BY JOB ORDER BY MAX_SAL DESC

--95>List the emps whose sal is equal to the average of max and minimum
SELECT ENAME, SAL FROM EMPY WHERE SAL = (SELECT (MAX(SAL) + MIN(SAL)) / 2 FROM EMPY)

--96>List the no. of emps in each department where the no. is more than 3.
select D.DNAME,count(E.DEPTNO) as Count_EMP from EMPY E join DEPt D on E.DEPTNO=D.DEPTNO group by D.DNAME having count(E.DEPTNO) > 3

--97>List the names of depts. Where atleast 3 are working in that department.
select D.DNAME,count(E.EMPNO) as Count_EMP from EMPY E join DEPt D on E.DEPTNO=D.DEPTNO group by D.DNAME having count(E.EMPNO)>=3

--98>List the managers whose sal is more than his employess avg salary.
SELECT M.ENAME AS MGR_NAME, M.SAL AS MGR_SAL FROM EMPY M JOIN EMPY E ON M.EMPNO = E.MGR GROUP BY M.EMPNO, M.ENAME, M.SAL HAVING M.SAL > AVG(E.SAL);

--99>List the name,salary,comm. For those employees whose net pay is greater than or equal to any other employee salary of the company.
SELECT ENAME, SAL, COMM FROM EMPY WHERE (SAL + COALESCE(COMM, 0)) >= (SELECT MAX(SAL) FROM EMPY);

--100>List the emp whose sal<his manager but more than any other manager.
select * FROM EMPY M JOIN EMPY E ON M.EMPNO = E.MGR where E.SAL<M.SAL and E.SAL > (SELECT MAX(SAL) FROM EMPY WHERE JOB = 'MGR' AND EMPNO != E.MGR)

--101>List the employee names and his average salary department wise.
select D.DNAME,avg(E.SAL) as Count_EMP from EMPY E join DEPt D on E.DEPTNO=D.DEPTNO group by D.DNAME
--102>Find out least 5 earners of the company.
select top 5SAL from empy order by sal asc

--103>Find out emps whose salaries greater than salaries of their managers.
select E.* from empy E JOIN EMPY M ON E.MGR = M.EMPNO WHERE E.SAL > M.SAL

--104>List the managers who are not working under the president.
SELECT E.* FROM EMPY E wHERE E.JOB = 'MGR'  AND E.MGR != (SELECT EMPNO FROM EMPY WHERE JOB = 'President')

--105>List the records from emp whose deptno is not in dept.
select * from EMPY E left join DEPt D on E.DEPTNO=D.DEPTNO where D.DEPTNO is null

--106>List the Name , Salary, Comm and Net Pay is more than any other employee.
SELECT E.ENAME, E.SAL, E.COMM, (E.SAL + COALESCE(E.COMM, 0)) AS NET_PAY 
FROM EMPY E WHERE (E.SAL + COALESCE(E.COMM, 0)) >= (SELECT MAX(SAL + COALESCE(COMM, 0))FROM EMPY)

--107>List the Enames who are retiring after 31-Dec-89 the max Job period is 20Y.
SELECT ENAME FROM EMPY WHERE DATEADD(YEAR, 20, HIREDATE) <= '1989-12-31'

--108>List those Emps whose Salary is odd value.
select * from EMPY where sal%2!=0

--109>List the emp’s whose Salary contain 3 digits.
select * from Empy where len(sal)=3

--110>List the emps who joined in the month of DEC.
select * from Empy where month(HIREDATE)=12

--111>List the emps whose names contains ‘A’.
select * from Empy where ename like ('%A%')

--112>List the emps whose Deptno is available in his Salary.
select * from EMPy where sal=DEPTNO

--113>List the emps whose first 2 chars from Hiredate=last 2 characters of Salary.
select * from EMPY where left(HIREDATE,2)=RIGHT(SAL,2)

--114>List the emps Whose 10% of Salary is equal to year of joining.
select * from EMPY where round((SAL/10),0)=year(HIREDATE)

--115>List first 50% of chars of Ename in Lower Case and remaining are upper C
select CONCAT(upper(left(Ename,(LEN(ename)/2))),lower(right(Ename,(LEN(ename)/2)))) from EMPY

--116>List the emps those who joined in company before 15th of the month.
select * from EMPY where day(HIREDATE)<15

--117>List the Dname, no of chars of which is = no. of emp’s in any other Dept.
SELECT D1.Dname FROM DEPT D1 JOIN (SELECT DEPTNO, COUNT(*) AS num_emps FROM EMPY GROUP BY DEPTNO) E ON D1.DEPTNO = E.DEPTNO 
WHERE LEN(D1.Dname) = E.num_emps

--118>List the emps who are working as Managers.
select * from EMPY where job = 'manager'

--119>List the Name of dept where highest no.of emps are working.
select D.DNAME,COUNT(E.EMPNO) as No_emp from EMPY E left join DEPt D on E.DEPTNO=D.DEPTNO group by D.DNAME

--120>Count the No. of emps who are working as ‘Managers’(using set option).
select count(*) from EMPY where JOB = 'Manager'

--121>List the emps who joined in the company on the same date.
select E.* from EMPY E join EMPY E1 on E.HIREDATE = E1.HIREDATE WHERE E.EMPNO != E1.EMPNO

--122>List the details of the emps whose Grade is equal to one tenth of Sales Dept.
select * from EMPY where GRADE=(select count(*)/10 from EMPY where DEPTNO = (select DEPTNO from dept where DNAME = 'sales'))

--123>List the name of the dept where more than average no. of emps are working.
SELECT D.DNAME FROM DEPT D JOIN EMPY E ON D.DEPTNO = E.DEPTNO GROUP BY D.DNAME HAVING COUNT(E.EMPNO) > 
(SELECT AVG(DeptCount) FROM (SELECT DEPTNO, COUNT(*) AS DeptCount FROM EMPY GROUP BY DEPTNO) AS AvgCount)

--124>List the Managers name who is having max no.of emps working under him.
SELECT ENAME FROM EMPY WHERE MGR IN (SELECT MGR FROM EMPY GROUP BY MGR HAVING COUNT(*)=
(SELECT MAX(NumEmployees) FROM (SELECT MGR, COUNT(*) AS NumEmployees FROM EMPY GROUP BY MGR) AS EmployeeCounts))

--125>List the Ename and Sal is increased by 15% and expressed as no.of Dollars.

--126>Produce the output of EMP table ‘EMP_AND_JOB’ for Ename and Job.

--127>Produce the following output from EMP .EMPLOYEE:- SMITH (clerk) ALLEN (Salesman)

--128>question got Skiped-----------------------------------------------
--129>There is no question for this-----------------------------------------------
--130>List the emps with Hire date in format June 4, 1988.
--131>Print a list of emp’s Listing ‘just salary’ if Salary is more than 1500, on target if Salary is 1500 and ‘Below 1500’ if Salary is less than 1500.
--132>Write a query which return the day of the week for any date entered in format ‘DD-MM-YY’.
--133>Write a query to calculate the length of service of any employee with the company, use DEFINE to avoid repetitive typing of functions.
--134>Give a string of format ‘NN/NN’, verify that the first and last two characters are numbers and that the middle character is’/’. 
--int the expression ‘YES’ if valid, ‘NO’ if not valid. Use the following values to test your solution. ‘12/34’,’01/1a’, ‘99/98’.
--135>Emps hired on or before 15th of any month are paid on the last Friday of that month those hired after 15th are paid on the first Friday of the following month.
--Print a list of emps their hire date and the first pay date. Sort on hire date.
--136>Count the no. of characters with out considering spaces for each name.
--137>Find out the emps who are getting decimal value in their Sal without using like operator.
--138>List those emps whose Salary contains first four digit of their Deptno
--139>List those Managers who are getting less than his emps Salary.
--140>Print the details of all the emps who are sub-ordinates to Blake.
--141>List the emps who are working as Managers using co-related sub-query.
--142>List the emps whose Mgr name is ‘Jones’ and also with his Manager name.
--143>Define a variable representing the expression used to calculate on emps total annual remuneration use the variable in a statement,
--which finds all emps who can earn 30000 a year or more.
--144>Find out how may Managers are their in the company.
--145>Find Average salary and Average total remuneration for each Job type. Remember Salesman earn commission.secommm
--146>Check whether all the emps numbers are indeed unique.

--147>List the emps who are drawing less than 1000 Sort the output by Salary. 
--148>List the employee Name, Job, Annual Salary, deptno, Dept name and grade who earn 36000 a year or who are not CLERKS.
--149>Find out the Job that was filled in the first half of 1983 and same job that was filled during the same period of 1984.
--150>Find out the emps who joined in the company before their Managers.
--151>
--152>
--153>
--154>
--155>
--156>
--157>
--158>
--159>
--160>
--151>