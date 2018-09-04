// 상속

class Person{
    var name: String = ""
    func selfIntroduce(){
        print("안녕하세요 \(name)입니다.")
    }
    static func stTypeFunc(){
        print("재정의 할 수 없는 함수")
    }
    class func clTypeFunc(){
        print("재정의 할 수 있는 함수")
    }
}

class Student: Person{
    var major: String = ""
    
    override func selfIntroduce(){
        print("안녕하세요 현재 \(major)를 배우고 있는 \(name)입니다.")
    }
    
    override class func clTypeFunc(){
        // 부모 클래스에서 가져온 함수
        super.clTypeFunc()
        print("자손클래스에서 재정의 되었습니다.")
    }
}

var stu: Student = Student()
stu.name = "onemoon"
stu.major = "swift"

stu.selfIntroduce()
//stu.clTypeFunc()
Student.clTypeFunc()
Person.stTypeFunc()

