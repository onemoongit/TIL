# BasicOperator

## 튜플

```swift
let (x,y) = (1,2)

```

같은 타입을 가지는 튜플의 비교 , 왼쪽에서 오른쪽으로 이루어지고 한번에 한개의 값만 비교한다. 

```swift
(1, "zebra") < (2, "apple")   
// true, 1이 2보다 작고; zebra가 apple은 비교하지 않기 때문
(3, "apple") < (3, "bird")    
// true 왼쪽 3이 오른쪽 3과 같고; apple은 bird보다 작기 때문
(4, "dog") == (4, "dog")      
// true 왼쪽 4는 오른쪽 4와 같고 왼쪽 dog는 오른쪽 dog와 같기 때문
```

### nil 병합 연산자

- a ?? b 형식을 갖는 연산자
    - `a != nil ? a! : b`의 축약형
    - 옵셔널 a가 nil 이 아니면 a를 unwrap하고 nil이면 b를 반환하라는 의미



## 범위 연산자

### 닫힌 범위 연산자
(a..b)의 형태로 범위의 시작과 끝이 있는 연산자 입니다. for-in loop에 자주 사용됩니다.

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```

### 반닫힌 범위 연산자

( a.. < b)의 형태로 a부터 b보다 작을 때까지의 범위를 갖습니다. 즉, a부터 b-1까지 값을 갖습니다. 이건 어디서 많이 본 범위! 그렇습니다. 보통 배열이 배열의 크기 - 1의 인덱스를 갖기 때문에 이 반 닫힌 범위 연산자는 `배열`을 다루는데 유용합니다.

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
```

### 단 방향 범위

[a...] [...a]의 형태로 범위의 시작 혹은 끝만 지정해 사용하는 범위 연산자 입니다. 지정한 시작 값 혹은 끝 값은 범위에 포함됩니다.

이를 응용해 [..<2] 와 같이 활용할 수도 있다.

```swift
for name in names[...2] {
    print(name)
}
// 위와 아래의 차이는 2가 포함되거나 포함되지 않는다.
for name in names[..<2] {
    print(name)
}
```


> [기본 연산자 (Basic Operators)](https://jusung.gitbook.io/the-swift-language-guide/basic-operators)