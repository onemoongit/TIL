func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var temp1: Int = 30
var temp2: Int = 50

swapTwoInts(&temp1,&temp2)

print(temp1 , temp2)

var inArr: Array<Int> = Array<Int>()
inArr.append(10)
inArr.append(20)
print(inArr)

func test(testArr: Array<Int>){
//    testArr.append(10)
    // let constant 로 변환이 된다 즉 값이 복사되어서 들어온다.
}

test(testArr: inArr)

print(inArr)
