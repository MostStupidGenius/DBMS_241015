-- 시퀀스(SEQUENCE)
/* 자동으로 순차적으로 증가하는 값을 만들어주는 객체 
 * CREATE SEQUENCE 시퀀스이름
 * START WITH 시작값
 * INCREMENT BY 등차값
 * 옵션
 * MAXVALUE 최대값
 * NOMAXVALUE 
 * MINVALUE 최소값
 * NOMINVALUE
 * */
-- 시퀀스 생성
CREATE SEQUENCE SEQ_POT
START WITH 1
INCREMENT BY 1;

-- POT 테이블의 ID값의 DEFAULT를 SEQ_POT으로 설정
-- 시퀀스는 특정 컬럼의 기본값으로 설정할 수 없다.
-- > 설정하고자 하면 트리거를 사용해야 한다.
--ALTER TABLE TBL_POT MODIFY (POT_ID DEFAULT SEQ_POT.NEXTVAL);

-- 시퀀스 사용
-- 데이터를 추가하면서 시퀀스를 사용할 수 있다.
INSERT INTO TBL_POT (POT_ID, POT_NAME)
VALUES (SEQ_POT.NEXTVAL, '점토 화분');

SELECT *
FROM TBL_POT;

-- 현재 시퀀스 값을 확인
SELECT SEQ_POT.CURRVAL FROM DUAL;

-- DUAL 테이블
-- 오라클 자체에서 제공하는 테이블로
-- 간단하게 함수를 사용해서 결과를 확인할 때 사용하는 테이블이다.
-- 실제로 어떤 데이터가 들어있는 테이블이 아니라
-- 테이블명을 입력해야 하는 자리를 채우기 위한 더미테이블이다.
SELECT *
FROM DUAL;

-- DUAL 용도
-- 시퀀스 값 확인
SELECT SEQ_POT.CURRVAL
FROM DUAL;

-- 현재 시각 확인(세계)
SELECT SYSDATE
FROM DUAL;

-- 현재 시각 확인(로컬)
SELECT CURRENT_DATE 
FROM DUAL;

INSERT INTO TBL_POT (POT_ID, POT_NAME, POT_PRICE)
VALUES (SEQ_POT.NEXTVAL, '나무 화분', 1000);

SELECT *
FROM TBL_POT;

-- NVL(A, B)함수
-- A컬럼의 값이 NULL이라면 B값이 대신 출력된다.
-- A컬럼의 값이 NULL이 아니라면 A값이 그대로 나온다.
-- -> NULL값인 데이터가 표시되는 것을 표준화하기 위해 사용된다.
SELECT POT_NAME, NVL(POT_PRICE, 0) AS PRICE
FROM TBL_POT;

-- NVL2(A, B, C)
-- A컬럼의 NULL 여부에 따라서 반환할 값을 선택한다.
-- A가 NULL이 아니면 B값을 반환
-- A가 NULL이면 C값을 반환한다.
SELECT POT_NAME
, NVL2(POT_PRICE, POT_PRICE * 1.5, 0) AS "판매 가격"
FROM TBL_POT;



