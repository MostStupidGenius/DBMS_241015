-- LEFT OUTER JOIN
-- 왼쪽 테이블의 모든 행을 포함하고
-- 오른쪽 테이블에서 조건에 맞는 행을 채워넣되,
-- 매칭되는 값이 없는 경우 NULL로 채워져 가져온다.
SELECT *
FROM STADIUM s ;

-- STADIUM 테이블의 모든 행을 보여주되,
-- HOMETEAM_ID가 없는 경우에는 NULL값을 채워준다.
SELECT S.STADIUM_NAME , T.TEAM_ID , T.TEAM_NAME 
FROM STADIUM S
LEFT OUTER JOIN TEAM T ON S.HOMETEAM_ID = T.TEAM_ID;
-- 하지만, RIGHT OUTER JOIN으로 TEAM 테이블을 기준으로
-- 조인했을 경우, HOMETEAM_ID가 없는 경기장은 제외된다.

-- FULL OUTER JOIN
-- LEFT와 RIGHT가 기준 테이블의 모든 행을 가져왔다면,
-- FULL OUTER JOIN은 두 테이블의 모든 행을 가져오는
-- 매우 포괄적인 아우터 조인 방식이다.
-- 두 테이블간의 불일치를 찾거나, 완전한 뷰를 얻고자 할 때 사용된다.
SELECT E.* , D.* 
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


