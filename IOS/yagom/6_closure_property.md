## 06_closure_playground & 07_property_playground

### Closure

- 코드의 블럭
- 일급 시민 
- 변수 상수등 저장 , 전달인자 저장 가능

```
{ ( 매개변수 목록 ) -> 반환타입 in
    실행코드
}
```

함수는 클로저의 일종이므로 변수에도 함수를 할당할 수 있다.

### Closure Advance
먼저 클로저 매개변수를 갖는 함수를 선언한 뒤 아래와 같은 기능을 사용할 수 있다.

예제 코드

```
func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var result: Int
```
- 후행 클로저
    - 마지막 전달인자가 클로저라면 마지막 매개변수 이름을 생략한 후 함수 소괄호 외부에 클로저를 구현할 수 있다.

```
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
```
- 반환타입 생략
    - 반환타입이 명확한 경우에는 굳이 반환타입을 명시할 필요가 없다.
```
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
```
- 단축 인자이름  
    - 매개변수의 타입도 이미 알고 있기 때문에 $number 로 매개변수를 표현할 수 있다.
```
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
```
- 암시적 반환 표현 
    - 클로저가 반환하는 값이 있다면 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급한다.
```
result = calculate(a: 10, b: 10) {
    $0 + $1
}
```

### property

- 저장 프로퍼티
- 연산 프로퍼티
- 인스턴스 프로퍼티
- 타입 프로퍼티 

```javascript
struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    /*
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
     */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // 간단히 위의 selfIntroduce() 메서드를 대체할 수 있습니다
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
        
    /*
     // 타입 메서드
     static func selfIntroduce() {
     print("학생타입입니다")
     }
     */
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있습니다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
yagom.name = "yagom"
print(yagom.name)
// yagom

// 인스턴스 연산 프로퍼티 사용
print(yagom.selfIntroduction)
// 저는 Swift반 yagom입니다

print("제 한국나이는 \(yagom.koreanAge)살이고, 미쿡나이는 \(yagom.westernAge)살입니다.")
// 제 한국나이는 10살이고, 미쿡나이는 9살입니다
```

### 프로퍼티 감시자

- willSet
- didSet 으로 사용 가능
바뀌기 전 혹은 바뀐 후에 값에 대해서 구문을 실행한다. newValue , oldValue 는 매개변수를 지정하지 않았을 때의 default 값이다. 

프로퍼티와 프로퍼티 감시자는 지역변수 혹은 전역변수에서도 사용이 가능하다는 점을 알아두자