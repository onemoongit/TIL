// closure 기본 사용
//{ (a:Int,b:Int) -> Int in return a+b }

func someFunc(_ a: Int,_ b: Int) -> Int {
    return a+b
}
// sum 이라는 변수는 클로저{(Int,Int) -> Int}가 들어갈 것이다.

var sum: (Int,Int) -> Int = {
    (a: Int, b: Int) -> Int in
        return a+b
}
print(sum(1,2)) // 3

sum = someFunc(_:_:)

print(sum(4,5)) // 9

func add(a:Int , b:Int) -> Int{
    return a+b
}
let sub: (Int,Int) -> Int = { (a:Int,b:Int) -> Int in return a-b }

func calculator(a:Int , b:Int , method: (Int,Int) -> Int ) -> Int{
    return method(a,b)
}

print(calculator(a: 1, b: 2, method: add))
print(calculator(a: 1, b: 2, method: sub))
print(calculator(a: 1, b: 3, method: {
    (left:Int, right:Int) ->Int in return left*right
} ))

// Closure Advance
// 후행클로저 , 반환생략 , 단축인자 , 암시적 반환

func newCal(a:Int ,b:Int,method: (Int,Int)->Int ) -> Int{
    return method(a,b)
}

var newVal: Int;

// 후행 클로저
newVal = newCal(a: 10, b: 10){
    (left: Int, right: Int) -> Int in return left + right
}
print(newVal)
// 반환 생략 {-> Int} 가 사라짐 => 컴파일러가 Int를 반환할 것을 이미 알고있기 때문에
newVal = newCal(a: 10, b: 10, method: {(left: Int, right: Int) in return left + right })
print(newVal)
// 후행클로저 + 반환 생략
newVal = newCal(a: 10, b: 10) {
    (left: Int, right: Int) in return left + right
}
// 단축인자
newVal = newCal(a: 10, b: 10 , method: { return $0+$1 })
print(newVal)
// 암시적 반환
newVal = newCal(a: 10, b: 10 , method: { $0+$1 })
print(newVal)
// 모든 축약
newVal = newCal(a: 10, b: 10){ $0*$1 }
print(newVal)



