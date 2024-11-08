-- 서브 쿼리
-- SELECT, FROM, WHERE, HAVING절, JOIN에서 주로 쓰이는
-- 내부 임시 테이블로서, 동적으로 임시 테이블을 생성하는 경우
-- 내부에 괄호()로 SELECT절을 사용하는 것으로 만들 수 있다.
SELECT * FROM EMPLOYEES e ;

SELECT E2.SALARY, E2.JOB_ID
FROM (
	SELECT SALARY, JOB_ID
	FROM EMPLOYEES 
	WHERE SALARY > 5000
) E2
WHERE E2.JOB_ID = 'IT_PROG'
;

-- WHERE절에서 서브쿼리 활용
-- WHERE절에서는 서브쿼리를 단일행 서브쿼리만 사용 가능하다.
-- 왜냐하면 비교하려는 값이 하나이기 때문에
-- 여러행을 가진 서브쿼리와 비교할 수 없기 때문이다.->다중행 오류

SELECT * FROM PLAYER;
SELECT P.PLAYER_NAME , P.WEIGHT, P.HEIGHT 
FROM PLAYER P
WHERE P.WEIGHT > (
	SELECT AVG(WEIGHT) -- 단일행 서브쿼리
	FROM PLAYER
)
ORDER BY P.WEIGHT 
;

--SELECT WEIGHT 
--FROM PLAYER
--WHERE WEIGHT > (
--	SELECT WEIGHT
--	FROM PLAYER
--	WHERE PLAYER_NAME LIKE '정%'
--)
--ORDER BY WEIGHT ;

SELECT WEIGHT
FROM PLAYER
WHERE PLAYER_NAME LIKE '정%';

SELECT WEIGHT
FROM PLAYER
WHERE PLAYER_NAME = '전광철';


-- FROM절에서의 서브쿼리 활용

SELECT AVG(WEIGHT) AS "정씨 평균 몸무게"
--FROM PLAYER;
FROM (
	SELECT PLAYER_NAME, WEIGHT, HEIGHT
	FROM PLAYER
	WHERE PLAYER_NAME LIKE '정%'
) P
LEFT JOIN (
	
) J
;


SELECT PLAYER_NAME, WEIGHT, HEIGHT
FROM PLAYER
WHERE PLAYER_NAME LIKE '정%';











-- 실습1
-- VIEW_STADIUM_SCHE 테이블에서
-- HOMETEAM_ID에 해당하는 TEAM_NAME과
-- AWAYTEAM_ID에 해당하는 TEAM_NAME을
-- 서브쿼리로 가지고 와서 
-- 경기장명, 경기날짜, 홈팀아이디, 홈팀명
-- 어웨이팀아이디, 어웨이팀명
-- STADIUM_NAME, SCHE_DATE,
-- HOMETEAM_ID, AS HOMETEAM_NAME,
-- AWAYTEAM_ID, AS AWAYTEAM_NAME
SELECT *
FROM VIEW_STADIUM_SCHE vss ;

SELECT V.STADIUM_NAME, HOME.TEAM_ID, HOME.TEAM_NAME
FROM VIEW_STADIUM_SCHE V
LEFT JOIN (
	SELECT SSC.HOMETEAM_ID AS TEAM_ID, T.TEAM_NAME TEAM_NAME
	FROM VIEW_STADIUM_SCHE SSC
	INNER JOIN TEAM t ON SSC.HOMETEAM_ID = T.TEAM_ID
) HOME
ON V.HOMETEAM_ID = HOME.TEAM_ID
;

SELECT SSC.HOMETEAM_ID, T.TEAM_NAME
FROM VIEW_STADIUM_SCHE SSC
INNER JOIN TEAM t ON SSC.HOMETEAM_ID = T.TEAM_ID;




