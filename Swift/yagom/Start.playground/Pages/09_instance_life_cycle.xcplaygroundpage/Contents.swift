class PersonA{
    var name: String = "unknown"
    var age: Int = 0
    var job: String = "unknown"
}

var ht: PersonA = PersonA()
ht.name = "hyeontae"
ht.age = 25
ht.job = "dev"

class PersonB{
    var name: String
    var age: Int
    var job: String?

    convenience init(_ name: String,_ age: Int,_ job:String) {
        self.init(name,age)
        self.job = job
    }
    
    init(_ name:String,_ age:Int){
        self.name = name
        self.age = age
    }
}

var jenny: PersonB = PersonB("jenny",20)
var suji: PersonB = PersonB("suji",21,"singer")
dump(jenny); dump(suji)

class Puppy{
    var name: String
    var owner: String!
    // 초기에 할당하지 않을 뿐 꼭 필요한 경우 암시적 추출 옵셔널 사용
    
    init(name:String) {
        self.name = name
    }
    
    func walk() -> Void {
        print("\(name)은 산책을 \(owner)와 가고있다.")
    }
}

var choco: Puppy = Puppy(name: "choco")
choco.owner = "ht"
choco.walk()


class PersonC{
    var name: String
    var age: Int
    
    init? (name:String,age:Int) {
        if (0...120).contains(age) == false{
            return nil
        }
        
        if name.count == 0{
            return nil
        }
        
        self.name = name
        self.age = age
        
    }
}

let hoho: PersonC? = PersonC(name: "hoho", age: 12)
let haha: PersonC? = PersonC(name: "haha", age: 123)
dump(hoho); dump(haha)

class PersonD{
    var name: String
    var puppy: String
    init(name: String,puppy:String) {
        self.name = name
        self.puppy = puppy
    }
    deinit {
        print("\(name)이 사라진 관계로 \(puppy)는 다른 사람에게 양도 됩니다.")
    }
}

var donald: PersonD? = PersonD(name: "donald", puppy: "happy")
donald = nil
