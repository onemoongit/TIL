//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # struct
struct Test{
    var varProper: Int = 100
    let letProper: Int = 100
    
    static var temp: Int = 200
    static let `class`: Int = 100
    func printHello(){
        print("안녕하세요")
    }
    static func printHello2(){
        print("안녕하세요 static ")
    }
}
var stru1: Test = Test()
stru1.varProper = 200
print(stru1.varProper)
print(stru1.letProper)
stru1.printHello()
//stru1.printHello2()
Test.printHello2()
Test.temp = 150
print(Test.temp)
print(Test.class)
print(Test.`class`)
//print(stru1.temp)

struct Student {
    var name: String = "unknown"
    var `class`: String = "swift"
    
    func printInfo(){
        print("저는 \(self.class)반의 \(name)입니다")
    }
}

var stuOne: Student = Student()
stuOne.name = "onemooon"
stuOne.printInfo()


//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # class

class ClStudent{
    var name: String = "unknown"
    var `class`: String = "swift"
    
    func printInfo(){
        print("저는 \(self.class)반의 \(name)입니다")
    }
}

let stuTwo: ClStudent = ClStudent()
stuTwo.name = "onemoon"
stuTwo.printInfo()
// class 는 let으로 선언해도 값을 변경할 수 있다.

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # enum

enum Weekday{
    case mon , tue , wen , thu
    case fri
    case sat,sun
}

var day: Weekday = Weekday.mon
print(day)
day = .fri
print(day)

switch day {
    case .mon, .tue, .wen, .thu:
        print("주중")
    case .fri:
//    case fri:
// enum 타입을 받았기 때문에 String 인 fri로 case를 분류할 수 없다.
        print("불금")
    case .sat, .sun:
        print("주말")
}

// 원시값을 저장할 수 있다.
enum Fruit: Int{
    case apple = 0
    case grape = 1
    case peach
    // peach는 2가 자동으로 들어가게 된다.
    
    func printFruit(){
        switch self{
        case .apple:
            print(self.rawValue)
            print(self.hashValue)
        default:
            print(self.rawValue)
            print(self.hashValue)
        }
    }
}

var fruit: Fruit = Fruit.apple
// fruit.printFruit()
// 0 0 출력
fruit = .peach
// fruit.printFruit()
// 2 2 출력

// 인스턴스 없이도 사용이 가능
Fruit.peach.printFruit()


//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # struct vs class

struct varType{
    var property = 1
}

class refType{
    var property = 1
}

let firstType: varType = varType()
var secondType: varType = firstType

secondType.property = 2

print(firstType.property) //1
print(secondType.property)//2


let thirdType: refType = refType()
var fourthType: refType = thirdType

fourthType.property = 3

print(thirdType.property) //3
print(fourthType.property)//3
















