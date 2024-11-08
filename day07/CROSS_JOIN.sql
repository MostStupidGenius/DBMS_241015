-- CROSS JOIN
-- 두 테이블의 가능한 모든 조합을 생성한다.
-- 실제 데이터와 무관하게 가능한 조합을 모두 연결시키기 때문에
-- 테스트 케이스 생성이나 대량의 데이터를 생성해야 하는 경우에만 쓰인다.
SELECT E.EMPLOYEE_ID , E.FIRST_NAME , D.DEPARTMENT_NAME 
FROM EMPLOYEES e 
CROSS JOIN DEPARTMENTS d ;

-- SELF JOIN
-- 자기자신의 테이블을 조인하는 방법이다.
-- 한 테이블 안의 데이터들끼리의 관계를 표현해야 할 때
-- 한정적으로 쓰인다.
SELECT E1.EMPLOYEE_ID EMP_ID, E1.FIRST_NAME EMP_NAME, E2.EMPLOYEE_ID MAN_ID, E2.FIRST_NAME MAN_NAME
FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
ORDER BY EMP_ID;



