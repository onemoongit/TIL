## 08_ingheri_instance_playground 
### inheritance

- 상속은 클래스 , 프로토콜 등에서 가능하다. 
- 열거형 ,구조체는 불가능
- 자바와 동일하게 다중상속은 불가능 하다.

```javascript
class 이름: 상속받을 클래스 이름{
    구현부
}
```

상속받은 메서드를 재 정의하고 싶다면 
1. 상속이 가능한 메서드 타입 이어야한다 ( `class func` , final - x , static - x )
1. 상속받은 클래스에서 `override` 라는 키워드를 사용해야 한다.

자바와 동일하게 자식 클래스에서 `super`라는 키워드를 사용하여 부모 클래스의 함수에 접근이 가능하다 ( 단순 프로퍼티의 경우에는 super 없이 접근이 가능하다. )

### instance

