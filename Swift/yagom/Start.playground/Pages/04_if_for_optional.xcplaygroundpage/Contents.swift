//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # for


//print("hello",terminator: "")
//print("world", terminator:" ")

print("some" , "someOther", separator: " + ")


var flag: Bool = true;

if flag {
    print("hello")
}

// if flag print("world")
// 중괄호가 없어서 사용 불가능

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # switch

var someVal: Int = 10

switch someVal {
case 1..<20: // 범위연산자
    print("wow")
    print(someVal)
    fallthrough
case 10:
    print("if you want excutes this line USE fallthrough")
default:
    print("default")
}

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # loop

var count: Int = 10;
// 다른 언어 스타일로 for문을 작성할 수 없음 대신 아래와 같은 for-in 구문을 이용해야 한다.
//for (count<15) {
//    print("count")
//    count++
//}

for tempCount in 0..<5{
    print(tempCount)
}

while count < 13{
    print("while")
    count += 1
    // count++ 없음
    // 증감 연산자는 += or -= 로 대신한다.
}

var intArr: [Int] = [1,2,3]
let names = ["one" : 1 , "two" : 2 , "three" : 3 ]

for tempInt in intArr {
    print(tempInt)
}

for (str,num) in names{
    print("String \(str) and Number \(num)")
}

//for i in 1..<10 { print("@") }
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # Optional

func printNum(inputNumber: Int){
    print(inputNumber)
}

func checkString(_ name: String?){
    print("hello \(name)")
}

var tempInt: Int? = nil
//var tempInt: Int? = 10

// if-let 구문은 해당 구문 안에서만 variable 사용이 가능
if let temp: Int = tempInt{
    printNum(inputNumber: temp)
}else{
    print("tempInt is nil")
}

// 여러 변수 if-let 사용 가능
var tempStr: String? = "onemoon"
if let check1 = tempInt , let check2 = tempStr{
    print("here")
}else{
    print("tempInt or tempStr is nil")
}


print(tempStr!)
//print(tempInt!)
// nil 을 강제추출 하려 했기 때문에 에러 발생






