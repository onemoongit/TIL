//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// Protocol

protocol Talkable{
    var topic: String{get set} // 읽기 쓰기 모두 가능해야 한다.
    var language: String{get} // 읽기만 가능해도 상관이 없다! ( 쓰기가 가능해도 상관은 없다! )
    
    func talk()
    
    init(topic: String , language: String )
}


class Korean: Talkable{
    var topic: String
//    let topic: String
    // let 은 Talkable 에 set을 만족시킬 수 없기 때문에 에러가 난다.
    var language: String
    
    func talk() {
        print("\(language)어로 \(topic)에 대한 말을 합니다.")
    }
    
    required init(topic: String , language: String) {
        self.topic = topic
        self.language = language
    }
}

var ht: Korean = Korean(topic: "swift", language: "korea")
dump(ht)
ht.talk()
ht.language = "en"
ht.talk()
// 왜 에러가 나지 않을까?

protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}
// 위와 같이 여러개를 상속할 수 있다.

class SuperClass: Readable {
    func read() { }
}
class SubClass: SuperClass, ReadWriteSpeakable {
    func write() { }
    func speak() { }
}
// 클래스 상속과 프로토콜 상속을 동시에 할 수 있다.

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
print(someAny is Readable) // true
print(someAny is ReadWriteSpeakable) // false

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// Extension

extension Int {
    var isEvenOrOdd: String {
        if self % 2 == 0 {
            return "Even"
        }else{
            return "Odd"
        }
    }
}

print(3.isEvenOrOdd)
