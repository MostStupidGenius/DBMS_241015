-- 연산자
-- 연결 연산자(Concatenation Operator)
-- || 를 여러 값 사이에 배치함으로써
-- 여러 값들을 하나의 값으로 만들어주는 효과를 가진다.
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME"
FROM EMPLOYEES e ;

-- AS
-- 알리아스라고 부르며 특정 컬럼의 이름을 변경하는 데 쓰인다.
-- AS는 생략 가능하지만, 가능하면 써주자.
--SELECT *
SELECT EMPLOYEE_ID AS "아이디",
FIRST_NAME || ' ' || LAST_NAME AS "FULL NAME",
EMAIL AS 이메일
FROM EMPLOYEES e ;

-- 산술 연산자
-- +, -, *, / 등이 있다.
SELECT SALARY, SALARY * 12 AS "ANNUAL SALARY"
FROM EMPLOYEES e ;

-- 관계 연산자
-- 두 값을 비교할 때 사용한다.
-- = 같니?
-- !=, <> 다르니?
-- >, <, >=, <=
-- 연봉이 10만달러 이상인 사람의 이름과 월급을 출력해라
SELECT FIRST_NAME, SALARY , SALARY * 12 AS "연봉"
FROM EMPLOYEES e 
WHERE (SALARY * 12) > 100000;

SELECT *
FROM EMPLOYEES e
WHERE JOB_ID = 'IT_PROG';

-- WHERE절 심화 - 특수 연산자
-- BETWEEN AND
   -- 컬럼명 BETWEEN A AND B
   -- A부터 B 사이에 컬럼의 해당 값이 존재하는지 여부(T/F)   
SELECT FIRST_NAME , SALARY
FROM EMPLOYEES 
WHERE SALARY BETWEEN 10000 AND 20000;
--WHERE SALARY >= 10000 AND SALARY <= 20000; 

-- IN
   -- 컬럼명 IN (값1, 값2, 값3)
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 90, 50);


-- LIKE
   -- 컬러명 LIKE 'A%'
   -- A로 시작하는 값인지 여부
	-- %는 문자열 앞뒤에 위치하여,
	-- 해당 문자열 앞뒤로
	-- 다른 문자가 올 수 있음을 나타낸다.
	-- _는 단일 문자가 올 수 있음을 나타낸다.
SELECT FIRST_NAME , SALARY , JOB_ID 
FROM EMPLOYEES
-- 'R_REP'이 값 중간에 나오는 경우 검색
WHERE JOB_ID LIKE '%R\_REP%' ESCAPE '\';
-- ESCAPE
-- 특수한 목적으로 사용되는 문자들(%, _)을
-- 문자로써 사용하기 위해 앞에 붙이는 탈출문자를
-- ESCAPE 문자라고 한다.
-- ESCAPE 문자를 직접 지정할 수 있다.
-- 일반적으로 역슬래시(\)를 사용한다.


-- IS NULL
   -- 컬럼명 IS NULL
   -- 해당 컬럼의 값이 NULL인지 여부
SELECT FIRST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- 논리 연산자(Logical Operators)
-- 논리값과 논리값을 연산하여
-- 그 결과 논리값이 나오는 연산자다.
-- AND(그리고)
	-- 좌우에 위치한 항의 값이 모두 TRUE인 경우
	-- TRUE를 반환한다. -> 하나라도 FALSE면 FALSE다
-- OR(또는)
	-- 좌우에 위치한 항의 값 중 하나라도 TRUE인 경우
	-- TRUE를 반환한다. -> 모두 FALSE이면 FALSE다
-- NOT(아니다)
	-- 우측에 위치한 논리값을 반전시키는 단항연산자다.

-- 월급이 3000 이상이고 부서ID가 10인 직원 조회
SELECT SALARY , DEPARTMENT_ID 
FROM EMPLOYEES
WHERE SALARY >= 3000
AND DEPARTMENT_ID = 10;


-- 직원의 FIRST_NAME과 SALARY 출력
SELECT FIRST_NAME , SALARY, SALARY * 12 AS "ANN"
FROM EMPLOYEES
-- 월급이 10000 이상이거나
WHERE SALARY >= 10000
-- 혹은 연봉이 100000이상인
OR SALARY * 12 >= 100000;



















