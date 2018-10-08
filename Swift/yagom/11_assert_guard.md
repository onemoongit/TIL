## Assertion ( Assert )


어플리케이션이 동작 도중에 생성하는 다양한 결과값을 동적으로 확인하고 안전하게 처리할 수 있도록 확인하고 빠르게 처리할 수 있습니다. 

- `assert(_:_:file:line:)`함수를 사용합니다.
- 디버깅 모드에서만 동작

```javascript
var someInt: Int = 0

assert(someInt == 0 , "someInt != 0" )
// someInt 가 0 이면 위의 라인을 통과한다. 
// 그렇지 않은 경우 break! ( 동작이 중지된다.)
```


## 빠른 종료 ( Early Exit ) -> guard else

- guard 를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료
    - 따라서 guard else 구문에는 return , break 구문이 필수
- 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작
- dictionary 에서 옵셔널타입에 굉장히 많이 쓰인다.

```javascript
// if와 비교
guard age < 100 else {return}
// 위 아래는 동일한 구문이다.
if age<100 {} else{
    return
}

// 일반적인 사용
func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
        print("나이값 입력이 잘못되었습니다")
        return
    } 
    print("당신의 나이는 \(unwrappedAge)세입니다")
}

// dictionary 에서의 사용
func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    print("\(name): \(age)")
    
}

someFunction(info: ["name": "jenny", "age": "10"])  // return
someFunction(info: ["name": "mike"])                // return 
someFunction(info: ["name": "onemoon", "age": 10])    // onemoon: 10

```

