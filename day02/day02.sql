-- CREATE
-- 테이블(등의 객체)을 생성하는 DDL명령어다
-- CREATE TABLE 테이블명 (컬럼 내용);
CREATE TABLE TBL_STUDENT (
	--	컬럼 정보를 적어줘야 한다.
	--	컬럼이름 자료형 옵션
	STUDENT_ID NUMBER PRIMARY KEY,
	NAME VARCHAR2(50),
	BIRTH_DAY DATE
);

-- 정보 변경
-- ALTER
-- 기존 테이블의 정보를 변경할 때 사용한다.
ALTER TABLE TBL_STUDENT 
ADD (EMAIL VARCHAR2(100));

-- 테이블 삭제
-- DROP
DROP TABLE TBL_STUDENT;

-- PK
-- PRIMARY KEY의 준말
-- 한 테이블의 각 행을 고유하게 나타내는 기준값을 의미한다.
-- 중복되지 않은 고유한 값을 설정해야 한다.








