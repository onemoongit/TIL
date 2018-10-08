## 01_Start_playground
### 이름짓기 , 콘솔로그 , 문자열 보간법

- 네이밍
    - 기본적으로 Camel Case 사용
- 콘솔로그
    - print
        - 단순 문자열 출력
        - ex ) print(hello world)
    - dump 
        - 인스턴스의 자세한 정보(description) 출력
- 문자열 보간법
    - 문자열 사이에 어떤 값을 넣고 싶을 때 사용
    - \ ( variable ) 
        - ex ) "안녕하세요 저는 \ (name) 입니다"


[참고 영상](https://www.youtube.com/watch?v=2n-fSlW-jts&list=PLz8NH7YHUj_ZmlgcSETF51Z9GSSU6Uioy)


### 상수와 변수의 선언

스위프트는 함수형 프로그래밍 패러다임을 채용한 언어답게 불변객체를 굉장히 중요하게 생각하고 있다.

- 차후에 변경이 불가능한 상수 let
- 차후에 변경이 가능한 변수 var

또한 상수의 선언을 먼저해줘도 상관없다 그 후 한번만 정의가 가능하다

### 기본 데이터 타입

Bool , Int , UInt , Float , Double , Character , String 

강제 형변환이 안된다는 사실을 알아두자 

### Any AnyObject nil

- Any - 스위프트 모든 타입
- AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
- nil - 없음을 나타냄
    - Any 와 AnyObject에 nil 을 할당하면 컴파일 에러가 난다.

## 02_array_playground
### 컬렉션타입
- Array , Dictionary , Set
    - Array : 순서가 있는 리스트 컬렉션
    - Dictionary : 키와 값의 쌍으로 이루어진 컬렉션
    - Set : 순서가 없고, 멤버가 유일한 컬렉션 ( 집합 )
        - union , sorted , intersection , subtracting


