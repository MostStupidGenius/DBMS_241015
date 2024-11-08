-- CASE-ELSE문
-- 특정 열이나 각각 다른 조건식의 결과에 따라서
-- 선택되는 값을 다르게 할 수 있는 문법이다.
-- CASE-ELSE-END
SELECT
	SALARY,
	CASE -- CASE문의 시작
		WHEN SALARY > 10000 THEN '고소득'
		WHEN SALARY BETWEEN 5000 AND 10000 THEN '중위소득'
--		WHEN SALARY < 5000 THEN '저소득'
--	ELSE SALARY || ''
	ELSE '기타' -- 위의 조건이 모두 거짓일 때 선택될 기본값
	END "소득분위"-- CASE문의 끝
FROM EMPLOYEES
ORDER BY SALARY
;

-- CASE-ELSE-END문 실습
-- PLAYER_NAME,
-- JOIN_YYYY -> CASE문
-- 2001~2005 초기
-- 2006~ 20012 후기
-- 그외 미기재

SELECT PLAYER_NAME 
FROM PLAYER;

-- CASE 컬럼 ELSE


-- CASE 컬럼 실습
-- PLAYER_NAME, POSITION
-- POSITION -> CASE문
-- DF 수비수
-- MF 미드필더
-- GK 골키퍼
-- FW 공격수
-- 그외 미지정

