-- SELECT
-- 데이터베이스에서 데이터를 조회할 때 쓴다.
-- FROM과 항상 함께 쓴다.
-- SELECT 컬럼명1, 컬럼명2,... FROM 테이블명
SELECT *
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES;

-- SELECT : 중복 제거
-- DISTINCT
/*
 * SELECT DISTINCT DEPARTMENT_ID 
 * FROM EMPLOYEES;
 */
-- DISTINCT는 SELECT 바로 뒤에 오고
-- 그 뒤에 컬럼명을 붙임으로써
-- 해당 컬럼의 중복값을 없앤 테이블을 보여준다.
-- 두 개 이상의 컬럼을 선택하면 중복제거가 안 된다.
SELECT DISTINCT DEPARTMENT_ID, MANAGER_ID 
FROM EMPLOYEES;

--	WHERE
-- 조건을 지정하여
-- 조건에 맞는 데이터만 조회할 때 쓰인다.
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 5000;

-- ORDER BY
-- 데이터를 정렬할 때 사용한다.
-- 기본적으로 오더바이를 안해도 오름차순으로 정렬되며
-- 내림차순으로 정렬하려면 DESC를 주면 된다.
-- ORDER BY 정렬할 컬럼명 ASC/DESC
-- ORDER BY로 정렬할 컬럼을 SELECT하지 않아도
-- 정렬된 상태로 보여준다. 오더 -> 셀렉트

SELECT FIRST_NAME, SALARY
--,EMPLOYEE_ID
FROM EMPLOYEES
WHERE SALARY > 5000
--ORDER BY FIRST_NAME DESC;
--ORDER BY SALARY DESC;
ORDER BY EMPLOYEE_ID DESC;

-- 행의 개수 제한
-- ROWNUM
-- 행 번호를 담고 있는 공통컬럼으로
-- WHERE절을 이용하여 행의 개수를 제한할 수 있다.
-- 정렬 전 테이블의 데이터를 기준으로
-- WHERE절에서 조건을 준 행 번호만 보여준다.
-- FROM -> WHERE -> ORDER BY -> SELECT 
SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE ROWNUM < 10;
--ORDER BY SALARY DESC;



