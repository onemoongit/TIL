class hello{
    var `class`: String = "swift"
    var name: String = "onemoon"
    var age: Int = 0
    var info: String {
        get{
            return "저는 \(name)이고 , 현재 \(self.class)반에 있습니다."
        }
    }
    // 읽기 전용 프로퍼티는 get을 생략 가능하다
    var info2: String{
        return "저는 \(name)이고 , 현재 \(self.class)반에 있습니다."
    }
    
    var westurnAge: Int{
        get{
            return age-1
        }
        set(input){
            age = input+1
        }
    }
}


var test: hello = hello()
print(test.info2)
test.age = 30
print(test.westurnAge)
test.westurnAge = 25
print(test.westurnAge)
print(test.age)

// 또한 변수에도 사용 가능

var a: Int = 100 {
    willSet{
        print("값이 \(a)에서 \(newValue)로 변경될 예정입니다.")
    }
    didSet{
        print("값이 \(oldValue)에서 \(a)로 변경되었습니다.")
    }
}
let b: Int = 20
var testVal: Int {
    return a+b
}

print(testVal)

a = 200
