-- 서브쿼리 연습해보기
-- 단일행 서브쿼리 - WHERE절
-- 자연어 -> 코드
-- 어떤 테이블을 조회할 것인가
-- 사람에 대한 정보를 가져와보자
SELECT PLAYER_NAME, TEAM_ID, BACK_NO 
FROM PLAYER P1
WHERE P1.PLAYER_NAME = (
	SELECT PLAYER_NAME 
	FROM PLAYER P 
-- BACK_NO가 1이면서 TEAM_ID가 K07인
	WHERE P.BACK_NO = 1
	AND P.TEAM_ID = 'K07'
);

-- 몸무게가 가장 많이 나가는 플레이어 정보를 조회해보자.
SELECT PLAYER_NAME , TEAM_ID , WEIGHT 
FROM PLAYER
WHERE WEIGHT = (
	SELECT MAX(WEIGHT)
	FROM PLAYER
);

--SELECT MAX(WEIGHT)
--FROM PLAYER
--WHERE WEIGHT IS NOT NULL
--ORDER BY WEIGHT DESC;

-- FROM절에서의 서브쿼리
SELECT P.PLAYER_NAME , T.TEAM_NAME 
FROM (
	SELECT P1.PLAYER_NAME, P1.TEAM_ID
	FROM PLAYER P1
	WHERE P1.PLAYER_NAME LIKE '김%'
) P -- 김씨인 플레이어만 가져오는 서브쿼리
JOIN (
	SELECT T1.TEAM_ID, T1.TEAM_NAME
	FROM TEAM T1
	WHERE T1.TEAM_NAME LIKE '%즈'
) T -- '즈'로 끝나는 팀명을 가진 팀만 가져오는 서브쿼리
ON P.TEAM_ID = T.TEAM_ID;


SELECT *
FROM (
	SELECT NVL(P1.BACK_NO, 0) AS BACK_NO, P1.PLAYER_NAME, P1.TEAM_ID
	FROM PLAYER P1
	WHERE P1.BACK_NO > 10 
);

SELECT *
FROM PLAYER;

-- 1. PLAYER 테이블에서 키가 평균 이상이면서
-- 몸무게가 80 이상인 선수에 대한
-- PLAYER_NAME, HEIGHT, WEIGHT 정보 조회해보기
SELECT PLAYER_NAME, HEIGHT, WEIGHT
FROM PLAYER P
WHERE P.WEIGHT >= 80 AND
	P.HEIGHT >= (
	SELECT AVG(HEIGHT)
	FROM PLAYER P1
)
ORDER BY P.HEIGHT 
--ORDER BY P.WEIGHT 
;
	
SELECT AVG(HEIGHT)
FROM PLAYER P1;


-- 2. STADIUM 테이블에서 평균 SEAT_COUNT보다 큰 대상에 대해서
-- STATDIUM_NAME과 SEAT_COUNT를 조회
SELECT STADIUM_NAME , SEAT_COUNT 
FROM STADIUM S
WHERE S.SEAT_COUNT > (
	SELECT AVG(S1.SEAT_COUNT)
	FROM STADIUM S1
)
ORDER BY SEAT_COUNT;
-- 가장 큰 SEAT_COUNT의 반절보다 큰 SEAT_COUNT를 가진 경기장 정보 조회
SELECT S.STADIUM_NAME , S.SEAT_COUNT 
FROM STADIUM S
WHERE S.SEAT_COUNT > (
	SELECT MAX(SEAT_COUNT)
	FROM STADIUM S1
)/3
ORDER BY SEAT_COUNT 
;

SELECT MAX(SEAT_COUNT)
FROM STADIUM s ; -- 66,806


SELECT AVG(SEAT_COUNT)
FROM STADIUM s ; -- 34,896

SELECT *
FROM STADIUM s ;

-- 
SELECT *
FROM SCHEDULE s ;

-- FROM JOIN 서브쿼리 연습
SELECT ST.STADIUM_NAME, SC.* 
FROM SCHEDULE SC
JOIN STADIUM ST
ON SC.STADIUM_ID = ST.STADIUM_ID;

-- 

SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS HOMETEAM_NAME
FROM SCHEDULE S
JOIN TEAM T
ON S.HOMETEAM_ID = T.TEAM_ID
;
SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS AWAYTEAM_NAME
FROM SCHEDULE S
JOIN TEAM T
ON S.AWAYTEAM_ID = T.TEAM_ID
;

--SELECT SC.SCHE_DATE, "HT".HOMETEAM_NAME, "AT".AWAYTEAM_NAME
--FROM SCHEDULE SC
--JOIN (
--	SELECT HT.SCHE_DATE, HT.STADIUM_ID, HT.HOMETEAM_NAME, AT.AWAYTEAM_NAME
--	FROM (
--		SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS HOMETEAM_NAME
--		FROM SCHEDULE S
--		JOIN TEAM T
--		ON S.HOMETEAM_ID = T.TEAM_ID
--	) "HT"
--	JOIN (
--		SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS AWAYTEAM_NAME
--		FROM SCHEDULE S
--		JOIN TEAM T
--		ON S.AWAYTEAM_ID = T.TEAM_ID
--	) "AT"
--	ON HT.STADIUM_ID = AT.STADIUM_ID AND 
--	HT.SCHE_DATE = AT.SCHE_DATE
--	)
--ON;

SELECT ST.STADIUM_NAME, SC.SCHE_DATE, SC.HOMETEAM_NAME, SC.AWAYTEAM_NAME
FROM STADIUM ST
JOIN (
--	3. 홈팀이름과 어웨이팀 이름, 경기날짜, 경기장ID를 가져온다.
	SELECT HT.SCHE_DATE, HT.STADIUM_ID, HT.HOMETEAM_NAME, AT.AWAYTEAM_NAME
	FROM (
--	1.홈팀ID에 대해서 팀이름을 가져오기 위한 서브서브쿼리
		SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS HOMETEAM_NAME
		FROM SCHEDULE S
		JOIN TEAM T
		ON S.HOMETEAM_ID = T.TEAM_ID
	) "HT"
	JOIN (
--	2.어웨이팀ID에 대해서 팀이름을 가져오기 위한 서브서브쿼리
		SELECT S.STADIUM_ID, S.SCHE_DATE, T.TEAM_NAME AS AWAYTEAM_NAME
		FROM SCHEDULE S
		JOIN TEAM T
		ON S.AWAYTEAM_ID = T.TEAM_ID
	) "AT" -- 홈팀이름, 어웨이팀이름, 경기날짜, 경기장ID를 가져오는 서브쿼리
	ON HT.STADIUM_ID = AT.STADIUM_ID AND 
	HT.SCHE_DATE = AT.SCHE_DATE -- 컬럼 하나만으로는 고유한 행을 나타낼 수 없기 때문에
--	두 개 이상의 값을 조합하여 고유한 값을 가려내기 위한 것이다.
) SC -- 홈팀, 어웨이팀 정보를 스타디움 이름과 연동하기 위한 서브쿼리
ON ST.STADIUM_ID = SC.STADIUM_ID
;









