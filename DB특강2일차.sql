-- GROUP BY 절

-- 집계함수
-- 여러 행들이 그룹으로 모여서 그룹당 단 하나의 결과를 돌려주는 함수

-- [ 집계함수의 종류 ]
-- COUNT() : 지정한 데이터의 개수를 반환
-- SUM() : 지정한 데이터의 합을 반환
-- MAX() : 지정한 데이터 중 최대 값 반환
-- MIN() : 지정한 데이터 중 최소 값 반환
-- AVG() : 지정한 데이터의 평균 값 반환

-- 일반적으로 집계 함수는 GROUP BY절과 같이 사용한다.
-- 단 테이블 전체가 하나의 그룹이 되는 경우에는 GROUP BY절 생략이 가능하다!

-- < 집계함수의 활용 >

SELECT COUNT(EMPLOYEE_ID) AS "총 직원수"
     , SUM(SALARY) AS "총 급여의 합계"
     , MAX(SALARY) AS "최대 급여"
     , MIN(SALARY) AS "최소 급여"
     , COUNT(MANAGER_ID) AS "상사 수"
     , COUNT(DEPARTMENT_ID) AS "소속된 부서의 수"
     , COUNT(*) AS "전체갯수"
     , ROUND(AVG(SALARY),2) AS "평균급여"
  FROM EMPLOYEES ;


-- [ 집계함수의 특징 ]
-- 1. NULL 값을 제외하는 특성을 가지고 있다.
-- 2. GROUP BY(그룹화) 가 되어 있는 상태에서만 집계함수를 사용할 수 있다.
-- 3. COUNT()에서만 *(아스타리스크)가 사용이 가능하다.


--[ GROUP BY절 기본 사용하는 방법 ]
-- SELECT       사용자가 조회하고자 하는 "컬럼의 정보"
-- FROM         컬럼의정보를 가져올 "테이블의 정보"
-- WHERE        사용자가 원하는 행을 선별하기 위한 "조건 식"
-- GROUP BY     특정 컬럼을 기준으로 "그룹화"
-- ORDER BY     특정 컬럼을 기준으로 "정렬화"

SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 직원테이블에서 부서별(GROUP BY) 급여의 총 합계(SUM)를 구하시오.


-- 문제1) 직원테이블에서 직책별(GROUP BY) 직원의 평균 급여(AVG)를 구하시오.
-- 단 평균 급여는 2번째 자리까지 반올림하여 출력하시오.


-- 문제2) 직원테이블에서 부서별(GROUP BY) 최대 급여(MAX), 최소 급여(MIN) 를 구하시오
-- 단 부서가 NULL인 것 제외하시오. 
-- 최대급여는 Max_Sal 최소급여는 Min_Sal이라는 별칭으로 출력
-- 부서 기준으로 오름차순 정렬


-- [ 그룹바이 사용 시 프로세스 ]
-- 1. 그룹의 조건을 확인해서 GROUP BY절에 해당 특정 컬럼을 작성 --> 그룹화가 된다.
-- 2. 그룹화가 잘 이루어 졌으면 SELECT절에 집계함수를 사용해서 "통계적 정보"를 도출하면 된다!

-- sql 작성 순서
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY

-- *** SQL 실행되는 순서 ***
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

-- HAVING 절
--> GROUP BY 이후 집계가 완료된 대상을 조건을 통해 필터링 하는 문법입니다.
--> 그룹화 이후에 집계함수에 대한 조건에 대한 필터링 하는 것이다!

--[ SQL 기본 사용방법 ]
-- 5.SELECT       사용자가 조회하고자 하는 "컬럼의 정보"
-- 1.FROM         컬럼의 정보(데이터)를 가져올 "테이블의 정보"
-- 2.WHERE        원하는 행(데이터)을 선별하기 위한 "조건식"  
-- 3.GROUP BY     특정 컬럼을 기준으로 "그룹화"
-- 4.HAVING       "그룹화"가 된 이후에 "집계함수"에 대한 "조건식"
-- 6.ORDER BY     특정 컬럼을 기준으로 "정렬화"

-- 부서별(GROUP BY) 평균 급여(AVG) 를 구하라.
-- 부서별 평균 급여가  9000 이상인 부서만 출력해와라.
-- 부서ID가 90에 해당하는 부서는 제외를 하시오.


-- 직원테이블에서 직무별(JOB_ID)(GROUP BY) 직원수가 5명(COUNT) 이상인 경우만 출력하시오.
-- 단 SA_MAN이라는 직책은 제외하시오.


-- 직원테이블에서 부서별(GROUP BY) 최고 연봉(MAX)이 100000 이상인 부서만 출력하시오.
-- 부서ID가 100, 30 , 90에 해당하는 부서만 출력하시오. (IN연산자 활용)


-- < JOIN >

-- 조인이란?
-- 두 개 이상의 테이블을 연결하여 관련이 있는 테이블을
-- 하나의 결과 값으로 조회할 수 있게 해주는 기술이다.
--> 즉 서로 다른 테이블에 나뉘어 저장된 관련 데이터를 연결하여 한번에 결과로 확인하는 작업

-- 직원ID, FIRST_NAME, DEPARTMENT_ID 조회하시오
SELECT EMPLOYEES.EMPLOYEE_ID
     , FIRST_NAME
     , DEPARTMENT_ID
  FROM EMPLOYEES;

-- 부서ID, DEPARTMENT_ID 를 조회하시오.
SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS;

-- 직원ID, FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME을 순서대로 출력하시오.

-- 1. CROSS JOIN = 카티션 곱
--> 조인 조건이 없는 조인 기술을 뜻함
--> 모든 경우의 수가 나오는 카티션 곱의 결과가 나오는 조인의 형태이다.
--> 직원테이블 107 곱하기 부서테이블 27 의 결과값인 2889의 모든 경우의 수의 행의 갯수가 출력
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLYOEES E, DEPARTMENTS D ;

-- 2.INNER JOIN
--> 등가연산자(=)를 사용하여 서로 같은 결과값을 가지는 결과값으로 조인하는 방법
--> ANSI조인문법으로 모든 DBMS에서 사용가능하다.
--> INNER 는 생략이 가능하다.

--[ INNER JOIN 의 사용방법 ]

-- SELECT   테이블1.컬럼명, 테이블2.컬럼명
-- FROM 테이블1 INNER JOIN 테이블2
--   ON (테이블1.컬럼명 = 테이블2.컬럼명)
-- WHERE 일반 조건절 (원하는 행을 선별하기 위한 조건식 ) ; 


-- 모든 직원의 직원ID, FIRST_NAME, JOB_ID, JOB_TITLE 의정보를 조회하시오.

--1) 오라클 조인 문법으로 풀이

--2) ANSI조인문법인 INNER JOIN으로 풀이

-- <정리>
-- 단독으로 존재한는 컬럼은 .(경로)를 안적어줘도 실행이 된다.
-- 코드의 가독성을 위해서 해당 테이블의 경로를 적어주는것이 올바르다!
-- 조인 조건은 PK와 FK 관계로 거의 대부분 이루어지지만, 전부 그런것은 아니다.
-- 의미적으로 같은 값을 가지는 컬럼 끼리 조인도 할수 있다.

-- 문제) 부서ID, 부서이름, MANAGER_ID, 부서장의이름의 정보를 조회하시오.
-- 부서장의 이름 = MANAGER_ID에 해당하는 직원테이블의 FIRST_NAME의 정보


-- 3. OUTER JOIN (외부조인)
-- 외부조인이라고 하며 두 개의 테이블간의 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을때 사용하는 조인 기술 
-- OUTER 는 생략 가능

-- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL 값도 포함하여 출력
-- 오라클 문법에서 적용시 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호를 작성

-- RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 NULL값도 포함하여 출력
-- 오라클 문법에서 적용시 : 조인 조건절에 반대인 왼쪽 컬럼에 (+) 기호를 작성

-- FULL OUTER JOIN : 양쪽 NULL값도 포함하여 출력
-- 오라클 문법에서는 지원을 안한다.

-- 문제1-1)LEFT OUTER JOIN 활용

-- 문제1-2)오라클 문법에서 LEFT OUTER JOIN을 활용



-- 문제2-1)RIGHT OUTER JOIN 활용

-- 문제2-2)오라클 문법에서 RIGHT OUTER JOIN 활용


-- 문제3)FULL OUTER JOIN 

    
-- 4. SELF JOIN(셀프조인) 
--> 같은 테이블에서 의미있는 결과를 도출할 수 있는 기법
--> 같은 테이블에서 조인하는 것이기 때문에 반드시 테이블에 별칭을 사용해야 한다.

-- 직원ID, 이름, 급여, 상사의정보를 조회하시오.

-- 3개 이상의 테이블 조인 

-- employees, departments, locaions 테이블을 조인하여 의미있는 정보 출력
-- employees 테이블 : employee_id, first_name, department_id
-- departments 테이블 : department_name, locaion_id
-- locations 테이블 : street_address, city



-- 문제) departments, locations, countries 테이블을 조인하여 의미있는 정보 출력
-- department_id, department_name, location_id, city, country_id, country_name


