## TypeCasting 

스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도 또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용합니다.

- is
- as

### 일반적으로 생각하는 TypeCasting

다른 언어를 살펴보면 보통 타입캐스팅은 다른 타입의 변수를 서로의 타입에 맞춰 할당하는 것을 말한다
```javascript
let a: Int = 10
let b: Double = Double(a)
```
하지만 이는 타입캐스팅이 아니라 동일한 값이지만 새로운 인스턴스를 생성하는 것 뿐이라고 생각하자 ( 실제로는 initializer들이 굉장히 많다. )

따라서 타입캐스팅이 타입을 변환하는 것이 아님을 기억하자

### 타입캐스팅은 보통 클래스에서 많이 사용된다. 

예를들어 Person > Student , Man 일 때

Person(instance) is Person => true
Man(instance) is Person => true
Student(instance) is Person => true 

를 반환하게 되고 이로 생기는 인스턴스들 또한 마찬가지로 확인할 수 있다.

### 또 이는 switch에서도 많이 사용된다.

예를 들어서 switch에 들어오는 어떤 param이 어떤 클래스인지 혹은 어떤 클래스의 자손인지 알고 싶을 때 `case is Person:`과 같은 구문 처리가 가능하다. 


### Upcasting 
`as`를 사용해서 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다. `Any` 혹은 `AnyObject` 로도 타입정보를 변환할 수 있습니다.

이는 암시적으로 처리 되므로 생략해도 무방합니다.

```javascript
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person() // as Any 생략가능
```

### DownCasting

`as? as!` 를  사용하여 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스의 타입 정보를 반환합니다.

#### 조건부 다운 캐스팅

- `as?` 를 사용 
- 캐스팅에 실패하면 `nil`을 반환 ( 타입에 맞지 않는다면 )
    - 따라서 결과의 타입은 `옵셔널`

```javascript
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil
```

#### 강제 다운 캐스팅

- `as!`를 사용
- 캐스팅에 실패하면 `런타임 오류`가 발생 
    - 캐스트 성공시에는 일반 타입을 반환

이는 반환타입이 `옵셔널 타입이 아니므로` 좀 더 일반적으로 활용할 수 있습니다.

```javascript
var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류
```




