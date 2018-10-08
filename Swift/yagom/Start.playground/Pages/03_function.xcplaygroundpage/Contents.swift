// 기본 함수 사용

func max() -> Int {
    print("hello function")
    return Int.max
}

print(max())

func buy() {print("wow")}

func sum(a: Int , b: Int) -> Int {
    return a+b
}

print(sum(a: 1, b: 4))

// 함수 고급

// @ 매개변수 기본 값
func testDefaultSum(a: Int , b: Int = 100) -> Int {
    return a+b
}

testDefaultSum(a: 50)
testDefaultSum(a: 50 , b:100)


// @ 전달인자 레이블
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 전달인자 레이블을 가지고 있는 함수를 사용할 때에는 매개변수의 이름이 아닌
// 레이블을 입력해야 한다.
// ! func greeting(friend: String,me: String) 인 함수랑 다른 함수이다.
print(greeting(to: "onemoon", from: "Swift"))

// @ 가변 매개변수

func welcomeMyFriends (me: String , freinds: String...) {
    print("\(me) 집에 오신것을 환영합니다. \(freinds) !")
}

welcomeMyFriends(me: "onemoon", freinds: "하나","둘" )

// @ 함수는 일급객체이다.
var wrapperFunction: (String,String) -> Void = greeting(to:from:)
wrapperFunction("Swift","onemoon")

//
//someFunction = greeting(friend:me:)
//someFunction("eric", "yagom") // Hello eric! I'm yagom
//
//
//// 타입이 다른 함수는 할당할 수 없습니다 - 컴파일 오류 발생
////someFunction = sayHelloToFriends(me: friends:)
//
//
func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function: greeting(to:from:))

// Hello jenny! I'm mike
runAnother(function: wrapperFunction)



