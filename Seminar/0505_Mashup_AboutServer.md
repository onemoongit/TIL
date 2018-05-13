# 5월 5일 세미나
## 서버란 무엇인가?

### 서버는 택배 상하차다.

- spof
    - single point of failure
    - 대부분의 토이 프로젝트
    - 문제점은 서버가 죽으면 끝이다.
- 문제점 해결
    - 여러개의 서버를 만든다.
        - 하나가 죽더라도 다른 서버를 통해서 서비스를 유지한다.
    - 여러개의 DB를 만든다.

## Web Server VS Was
- web server 는 정적인 페이지를 제공하는 것
- 동적인 자료들 > DB , 목록 조회 등을 WAS 를 통해서 한다.

- ngix vs apache
- 아파치가 예전에 대부분을 장악했지만 ngix 가 최근에 비동기 방식등 새로운 방식등을 제공해서 많이 뜨는 추세이다.

## 실제 서버 운영 ?
- 여러개의 기능별로 서버를 나눠서 필요한 곳에 재 사용한다.
- 로그인 인증 , 채팅 , 물리엔진 서버 등등... 나눈다.

## WAS 를 개발하기 위해서 알아야 할 것들
1. RESTful API
    - http ( v0.9 ~ v2.0)
    - https
1. GET POST 
    - get 은 조회용이다.
    - 그리고 get에는 한계가 있다.
    - post 로 작업을 한다.
    - 다른 optional method 를 사용해서 구조를 작성하는 것이 RESTful api
1. json  
    - swagger 등을 이용해서 api 를 문서화 시켜야 한다.
    - 최근에는 [bson](http://bsonspec.org/) 도 있으니 한번 살펴보자
    - 따라서 먼저 문서를 만들어 놓고 개발을 하는 것이 편하다.
1. cache
    - redis , ramcache 가 사용된다.
1. ELK를 통한 로그 관리
    - Elastic Search
    - Logstash
    - Kibana
1. CI / CD
    - countinous integration , delivery
    - jenkins 를 사용한 배포 자동화 