-- 1.
-- SALARY가 3000에서 5000 사이인
-- 직원의 FIRST_NAME과 SALARY 출력
SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000;

-- 2.
-- DEPARTMENT_ID가 10, 20, 30인
-- 직원의 FIRST_NAME과 SALARY, DEPARTMENT_ID 출력
SELECT FIRST_NAME , SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30);

-- 3.
-- FIRST_NAME이 'A'로 시작하는
-- 직원의 FIRST_NAME과 SALARY 출력
SELECT FIRST_NAME , SALARY 
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';
--ORDER BY SALARY ASC;

