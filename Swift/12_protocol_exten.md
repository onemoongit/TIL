## 프로토콜 & 익스텐션 

### 프로토콜

특정 역할을 수행하기 위한 메서드 프로퍼티 이니셜라이저 등의 요구사항을 정의 ( 자바의 인터페이스 생각 )

필요한 기능등을 꼭 구현하도록 강요시키는 역할 - 이를 채택한다 하고

실제로 구현해 놓은 것을 구현한다 라고 표현을 한다.

```javascript
protocol name{
    // definition
}
```

1. 프로퍼티 요구 (var 사용)
    - get set 사용 
1. func 메서드 요구
1. 이니셜라이저 요구

타입뒤에 콜론을 찍고 프로토콜을 채택하면 된다.

프로토콜 또한 상속을 받을 수 있다. 그리고 상속받은 기능 또한 요구된다는 사실을 알아야 한다.

#### 클래스 상속과 프로토콜

클래스에서 상속과 프로토콜을 동시에 받고 싶을 때 에는 상속받을 클래스를 먼저 작성하고 그 뒤에 프로토콜들을 상속받으면 된다.

```javascript
class Hello: World,readable,writeable{
    // 여기서 World는 클래스
    // readable,writeable 은 protocol
}
```

### 익스텐션

여러 타입에 새로운 기능을 추가할 수 있는 기능 , 타입을 알고 있으면 새로운 메서드나 이니셜라이저등 추가할 수 있다.

프로토콜 준수 또한 추가할 수 있다.

```javascript
extension 확장할 타입 이름{

}

extension 확장할 타입 이름: protocol1,protocol2{
    // 요구사항
}

// 실제 사용
extension: Int{
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
    
    func ...{}

}
1.isEven ==> false
```

















