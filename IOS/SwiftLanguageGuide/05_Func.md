# 함수 (Functions)

## 정의와 호출 (Defining and Calling Functions)

```swift
func greet(person: String) -> String {
 let greeting = "Hello, " + person + "!"
 return greeting
}

or

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

```

## 함수 파라미터와 반환 값 (Function Parameters and Return Values)

```swift
// parameter 없음
func sayHelloWorld() -> String {
    return "hello, world"
}
// 반환값 없음
func greet(person: String) {
    print("Hello, \(person)!")
}
```

##### 반환값을 선언하지는 않았지만 것은 사실상 void라는 특수형을 반환한다는 것을 알아두자 

## 복수의 값을 반환하는 함수 (Functions with Multiple Return Values)

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

## 인자 라벨 지정 (Specifying Argument Labels)

내부에서 사용하는 값과 호출시 입력하는 값을 다르게 설정할 수 있다.

```swift
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, `parameterName` refers to the argument value
    // for that parameter.
}
```

이렇게 사용하면 밖에서는 someFunction(`argumentLabel`: Int) 로 사용할 수 있다.

## 인자 생략 (Omitting Argument Labels)

_ 를 사용하여 함수에 사용되는 인자를 생략할 수 있다.

## 기본 파라미터 값 (Default Parameter Values)

default 인자값을 설정해줄 수 있다. 호출시 파라미터 개수가 다를 수 있다.

```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // body
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
```

## 집합 파라미터 (Variadic Parameters)

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```

## 인-아웃 파라미터 (In-Out Parameters)

```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

```

무조건 `&` 키워드가 들어가야 한다는 것을 알아두자

## 함수 형 (Function Types)

함수 형은 두가지가 있다. 
1. 파라미터형
1. 반환형

함수를 변수처럼 정의해서 사용할 수 있다.

또한 변수나 상수에 함수를 할당할 때 직접 함수 형을 선언하지 않아도 Swift가 형을 추론해(Type Inferred) 자동으로 함수를 할당할 수 있습니다.

```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
let anotherMathFunction = addTwoInts
```

## 파라미터 형으로써의 함수 형 (Function Types as Parameter Types)

```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
```

## 반환 형으로써의 함수 형 (Function Types as Return Types)

```swift
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
// 이러한 func들이 있다고 했을 때
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
// 위의 코드는 함수를 반환한다.

```

## 중첩 함수 
전역에서는 감춰져 있고 body 내부에서만 사용이 가능하다.
```swift
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
```

