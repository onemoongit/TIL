# 제어문 ( controll flow )

## for-in Loops 

만약 순서대로 제어할 필요가 없다면 `_`를 사용해서 성능을 높일 수 있다.

```swift
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
```

stride(from:to:by:) 함수와 함께 사용할 수 있다. 

```swift
// 구간을 5로 설정한 경우
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
// render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
```

## While Loops

### Repeat-While 

```swift
// do-while 이 바뀐 형태라고 생각하면 된다.
repeat {
    statements
} while condition

```

### switch 

```swift
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// case 안에 콤마(,)로 구분해서 복수의 case 조건을 혼합(compound)해 사용할 수 있다.
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"

```

### switch - 암시적 진행 ( `Implicit Fallthrough` )
참고로 swift에서는 `break`를 사용하지 않아도 된다는 장점이 있다. 다른 언어의 경우 default를 만날때까지 내려가고 이를 방지하기 위해서 break를 사용하지만 swift는 해당 케이스만 들어갔다가 나온다. 이를 암시적인 진행을 하지 않는다고 말한다. ( `No Implicit Fallthrough` )

하지만 혹자는 이 기능을 그대로 사용하고 싶을 수도 있다. 이를 위해서 스위프트는 `fallthrough`라는 키워드를 사용할 수 있는데 이를 사용하면 이전 처럼 break가 없다면 다음 case가 진행되는 로직을 구현할 수 있다.

### switch - interval matching

숫자의 특정 점위를 조건으로 사용할 수 있습니다.

```swift
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
```

### gaurd let 

guard문을 이용해 특정 조건을 만족하지 않으면 이 후 코드를 실행하지 않도록 방어코드를 작성할 수 있습니다.

```swift
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
​
    print("Hello \(name)!")
​
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
​
    print("I hope the weather is nice in \(location).")
}
​
greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

```