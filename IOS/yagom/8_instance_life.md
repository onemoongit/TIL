## instance life cycle

- init
- deinit

```javascript 
class PersonA{
    var name: Stirng = "unknown"
    // var name: Stirng // Error!!
    var age: Int = 0
    var nickName: String = "nick"
}
```

모든 저장 프로퍼티에 기본값이 할당되어있다. 이는 Person이 초기화 되었을때 모든 프로퍼티에 정상적인 값이 들어가 있어야 한다는 규칙이 있기 때문이다.

하지만 이는 우리의 의도와 맞지 않을 수 있으며, 이를 해결하기 위해서 이니셜라이저를 구현하면 된다. 이 때 기본값은 없어도 무방하다.

옵셔널도 사용이 가능하며 여러개의 init 을 사용할 수 있다. 또한 미리 만들어져 있는 이니셜 라이저를 사용할 수 있다. 단 `convenience` 라는 명령어를 붙여야 한다.

또한 `init?` 이라는 키워드로 이니셜라이즈가 실패한 경우 `nil`을 반환하도록 말할 수 있다.

`암시적 추출 옵셔널`을 통해서 인스턴스에 꼭 필요하지만 초기값을 나중에 초기값을 할당하고 싶은 클래스를 선언할 수 있다.

인스턴스가 메모리에서 해결되는 시점에 deinit 이 실행된다. 