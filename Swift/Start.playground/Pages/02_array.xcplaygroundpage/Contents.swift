var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 123.12

// let someDouble: Double = someAny  // 컴파일 오류발생


class SomeClass {}

var someAnyObject: AnyObject = SomeClass()

//someAny = nil // 컴파일 에러 발생

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// # Array

var intarr: Array<Int> = Array<Int>()

intarr.append(3)
intarr.append(5)

intarr.contains(10)

intarr.remove(at: 0)
intarr.append(10)
//intarr.removeLast()
//intarr.removeAll()
intarr.count

// 리터럴형식으로 선언 가능
var doubleArr: Array<Double> = [Double]()
var doubleArr2: Array<Double> = []
var doubleArr3: [Double] = []

let tempArr: [Int] = [1,2,3]
// 사용 불가능 ( 불변 )
//tempArr.append(3)
//tempArr.remove(0)

// # Dictionary

// Dictionary 는 뒤에 콜론이라는 것을 기억하자
var oneDic: Dictionary<String,Any> = Dictionary<String,Any>()
oneDic["hello"] = "world"
oneDic["swift"] = 123
print(oneDic)
oneDic["hello"] = nil // hello 자체가 사라진다.
print(oneDic)
oneDic.removeValue(forKey: "swift")
print(oneDic)
oneDic

// Dictionary 또한 리터럴 형식이 존재
// var twoDic: [String: Int] = [:] // 빈 형식으로 선언 나중에 수정 가능
let twoDic: [String: Int] = [:]
let threeDic: [String: Int] = ["hello":1,"name":2]

twoDic
threeDic

//Dictionary에 값이 있을수도 있고 없을수도 있기 때문에 들어갈 수가 없다.
//let someVal: Int = threeDic["hello"]
//print(someVal)

// # Set

var integerSet: Set<Int> = Set<Int>()

integerSet.insert(1)
integerSet.insert(2)
integerSet.insert(3)
integerSet.insert(3)
integerSet.insert(3)

integerSet
integerSet.count

var integerSet2: Set<Int> = [1,2,3,5]
var integerSet3: Set<Int> = [1,2,4,6]

var unionSet: Set<Int> = integerSet2.union(integerSet3)
let sortedUnion: [Int] = unionSet.sorted()
let temp2Set: Set<Int> = unionSet.intersection(integerSet2)
//let temp2Set: Set<Int> = unionSet.subtracting(integerSet2)














