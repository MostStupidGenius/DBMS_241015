-- TO_CHAR
-- 숫자나 날짜를 정해진 형식 지정자에 맞게
-- 문자열로 변환해주는 함수
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI')
FROM DUAL;

SELECT TO_CHAR(123456.78, '999,999.999')
FROM DUAL;

-- TO_NUMBER
-- 문자열을 숫자로 변환해주는 함수
-- 형식 지정을 정확하게 해주어야 한다.
-- TO_NUMBER(문자열, 어떤 형식으로 이루어졌는지 형식 지정자)
SELECT TO_NUMBER('$1,234,567.33', '$9,999,999,999.99') 
FROM DUAL;

-- TO_DATE
-- 문자열로 작성된 다양한 날짜 값을 DATE타입의 값으로
-- 변환하기 위한 함수다.
-- 2024/11/01 09:00:00
SELECT TO_DATE('2024/11/01 09:00:00', 'YYYY/MM/DD HH:MI:SS')
FROM DUAL;

-- 24.11.01
SELECT TO_DATE('24.11.01', 'YY.MM.DD')
FROM DUAL;

-- 24-03-01 15:00:58
SELECT TO_CHAR(SYSDATE, 'YYYY MON')
FROM DUAL;
SELECT TO_DATE('24-DEC-01 15:00:58', 'YY-MON-DD HH24:MI:SS')
FROM DUAL;

ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH'; -- 영어
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'; -- 한국어

-- CAST - SQL표준을 따른다.
-- 서로 다른 데이터베이스 간의 데이터타입의 호환성을 위해서
-- 사용하는 함수로, AS 뒤에 바꾸고자 하는 데이터타입을 입력하는 것으로
-- 쉽게 변환할 수 있다.

-- CAST(바꾸고자하는 값 AS 데이터타입)
SELECT 
	CAST('1234' AS NUMBER) AS 숫자, -- 숫자로 이루어진 문자를 숫자로 변환
	CAST(SYSDATE AS VARCHAR2(100)) AS 날짜문자, -- 날짜를 문자로 변환
	CAST('2024-JAN-01' AS DATE) AS 날짜 -- 문자로 이루어진 날짜를 날짜타입으로 변환
FROM DUAL;






