## 옵셔널 체이닝

옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다.

```javascript
class Person{
    var name: String
    var Apartment: Apartment?
}

class Apartment{
    var building: String
}

// 위와 같이 할당할 수 있다.
// 이때 아래와 같은 구문을 사용할 수 있다.

if let gaurdJob = owner?.home?.guard?.job{
    print("우리집 경비원의 직업은 \(guardJob) 입니다.")
}else{
    print("우리집 경비원은 직업이 없어요")
}
```

## nil 병합 연산자 

앞의 값이 nil이라면 뒤의 값을 반환해라

```javascript
guardJob = one?.home?.guard?.job ?? "원펀맨"
// 만약 one?.home?.guard?.job 의 값이 nil이 나온 경우 원펀맨이 guardJob에 할당이 된다.
```