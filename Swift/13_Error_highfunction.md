## 오류처리 & 고차함수

### 오류 처리 Error Handling

오류 표현방식 + 처리하는 방식

Erorr 프로토콜을 사용하고 열거형을 통해서 표현

```javascript
enum 오류 이름 : Error{
    case 종류1
    case 종류2
}

enum VendingMachineError: Error{
    case invalidInput
    case ...
}
```

이는 함수 안에서 자신을 호출한 곳에 오류를 throws로 던진다.

오류를 내포하는 함수를 사용할 때에는 do-catch구문과 함께 try를 사용해야 한다 

- try 

do {
    try func
}catch Error


- try?
별도의 오류 처리 결과를 통보받지 않고 오류가 발생하면 결과값을 nil로 받는다

- try!
오류가 발생하지 않을 것이라는 확신을 가질 때 ! 를 사용한다. 하지만 오류가 발생하면 런타임 에러가 발생한다.


### 고차함수

swift에서 유용하게 사용할 수 있는 함수들

전달인자로 함수를 받거나 함수 실행의 결과를 함수로 반환하는 함수를 고차함수 라고 한다.
- map 
컨테이너 내부의 기존 데이터를 변형하혀 새로운 컨테이너 생성 
- filter 
내부의 값을 걸러서 새로운 컨테이너로 추출
- reduce
컨테이너 내부의 콘텐츠를 하나로 통합 
