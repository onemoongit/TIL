var someInt: Int = 0

//assert(someInt != 0 ,"hello zero")
// 맞으면 지나가고 아니면 message 출력 그리고 동작 중지

func funcwithAssert(age: Int?){
    assert(age != nil , "age == nil")
    assert((age! < 120) && (age! > 0)  ,"나잇값 입력이 잘못 되었습니다.")
    print("당신의 나이는 \(age!)입니다.")
}

//funcwithAssert(age: 1010)
//Assertion failed: 나잇값 입력이 잘못 되었습니다.: file 10_assert_guard.xcplaygroundpage, line 8
//Playground execution failed:

func funcwithGaurd(age: Int?){

    guard let unwrappedAge = age ,
    unwrappedAge < 120, unwrappedAge >= 0 else{
        print("나잇값 입력이 잘못 되었습니다.")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다.")
}


//funcwithGaurd(age: 1010)
//funcwithGaurd(age: 10)

// dictionary 에서 많이 사용된다고 함
func funcwithDic(info: [String:Any]){
    guard let name = info["name"] as? String else {
        print("string으로 입력되지 않았습니다.")
        return
    }
}

