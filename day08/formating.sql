-- TO_CHAR()함수
-- DATE타입 데이터를 원하는 형식(형식 지정자)의 문자열 데이터로 변환하는 함수
SELECT TO_CHAR(SYSDATE, 'YYYY') || '년' || TO_CHAR(SYSDATE, 'MM') || '월' 현재시간
FROM DUAL;

