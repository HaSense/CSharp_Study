[OPENBOOK TEST]
1. 오라클 처음 접속 후 hr 계정을 열려면 어떻게 해야 하나요?
   1-1 관리자 계정 접속 쿼리 : (   CONN SYSTEM                     )
   1-2 연습용 계정 열기 쿼리 : (   ALTER USER hr ACCOUNT UNLOCK  )
2. 오라클 처음 접속 후 hr 계정의 비밀번호를 hr로 재지정 하려면 어떻게 해야 하나요?
   비밀번호 변경 쿼리 : (   ATLTER USER hr IDENTIFIED BY hr )
3. (p125 연습문제 - Q1) EMP 테이블을 사용하여 사원 이름(ENAME)이 S로 끝나는 사원 데이터를 모두 출력
하는 SQL문을 작성해 보세요.
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S';

4. (p125 연습문제 - Q2) EMP 테이블을 사용하여 30번 부서에서 근무하고 있는 사원 중에 직책이 SALESMAN인
  사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력하는 SQL문을 작성해 보세요.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP 
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';

5. (p125 연습문제 - Q3)
-- 집합연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO IN (20, 30) 
   AND SAL > 2000;

-- 집합연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;

6. (p126 연습문제 - Q4)
SELECT * 
  FROM EMP
 WHERE SAL < 2000
    OR SAL > 3000;

7. (p126 연습문제 - Q5)
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND ENAME LIKE '%E%'
   AND SAL NOT BETWEEN 1000 AND 2000;

8. (p126 연습문제 – Q6)
SELECT *
  FROM EMP
 WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L%';

9. (p174 연습문제 – Q1)
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
 FROM  EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6; 
10. (p174 연습문제 – Q2)
SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
  FROM EMP; 

11. (p175 연습문제 – Q3)

SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
  FROM EMP; 


12. (p175 연습문제 – Q4)
SELECT EMPNO, ENAME, MGR,
       CASE
          WHEN MGR IS NULL THEN '0000'
          WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
          WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
          WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
          WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
          ELSE TO_CHAR(MGR)
       END AS CHG_MGR
  FROM EMP;


13. (p212 연습문제 – Q1)
SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY DEPTNO; 



14. (p212 연습문제 – Q2)
SELECT JOB,
       COUNT(*)
  FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

15. (p212 연습문제 – Q3)
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
       DEPTNO,
       COUNT(*) AS CNT
  FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

16. (p213 연습문제 – Q4) 추가 수당(Comm)을 받는 사원 수와 받지 않는 사원 수를 출력하세요.
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*) AS CNT
  FROM EMP
GROUP BY NVL2(COMM, 'O', 'X'); 
17. (p239 연습문제 – Q1) 
-- SQL-99 이전 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.SAL > 2000;

-- SQL-99방식
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
  FROM EMP E NATURAL JOIN DEPT D
 WHERE E.SAL > 2000;
18. (p239 연습문제 – Q2)
SELECT D.DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;


--SQL-99 방식
SELECT DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E JOIN DEPT D USING (DEPTNO)
GROUP BY DEPTNO, D.DNAME;

19. (p239 연습문제 – Q3)
--SQL-99 이전 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

--SQL-99 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

20. (p262 연습문제 – Q1) ALLEN과 같은 직책(JOB)인 사원들의 사원 정보, 부서 정보를 출력하세요.
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND JOB = (SELECT JOB
                FROM EMP
               WHERE ENAME = 'ALLEN'); 

21. (p263 연습문제 – Q3)
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 10
   AND JOB NOT IN (SELECT DISTINCT JOB
                     FROM EMP
                    WHERE DEPTNO = 30); 

22. (p263 연습문제 – Q4)
-- 다중행 함수 사용하지 않는 방법
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT MAX(SAL)
                FROM EMP
               WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 

--다중행 함수 사용하는 방법
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > ALL (SELECT DISTINCT SAL
                    FROM EMP
                   WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 

23. (p287 연습문제 – Q1)
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'ORACLE', 'BUSAN'); 
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (70, 'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (80, 'DML', 'BUNDANG'); 
24. (p324 연습문제 – Q1)
CREATE TABLE EMP_HW ( 
     EMPNO    NUMBER(4), 
     ENAME    VARCHAR2(10), 
     JOB      VARCHAR2(9), 
     MGR      NUMBER(4), 
     HIREDATE DATE, 
     SAL      NUMBER(7, 2), 
     COMM     NUMBER(7, 2), 
     DEPTNO   NUMBER(2) 
); 

25. (p324 연습문제 – Q2)
ALTER TABLE EMP_HW 
  ADD BIGO VARCHAR2(20);

26. (p324 연습문제 – Q3)
ALTER TABLE EMP_HW 
MODIFY BIGO VARCHAR2(30); 

27. (p324 연습문제 – Q4)
ALTER TABLE EMP_HW 
RENAME COLUMN BIGO TO REMARK;

28. (+3) 자동 획득

29. (p325 연습문제 – Q5)
INSERT INTO EMP_HW 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL 
  FROM EMP; 

30. (p325 연습문제 – Q4) EMP_HW 테이블을 삭제하기 위한 쿼리를 작성하세요.
DROP TABLE EMP_HW;



