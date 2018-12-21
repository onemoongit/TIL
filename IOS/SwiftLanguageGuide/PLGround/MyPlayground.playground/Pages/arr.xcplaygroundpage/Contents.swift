func minMax(arr: [Int]) -> (max: Int, min: Int){
    var currentMin = arr[0];
    var currentMax = arr[0];
    for value in arr[1..<arr.count]{
        if value > currentMax{
            currentMax = value
        }else if value < currentMin{
            currentMin = value
        }
    }
    return (currentMax,currentMin)
}

var testArr: [Int] = [1,2,3,4,6,10,35,0,-1]

//print(minMax(arr: testArr));

var testdot: [Int] = Array<Int>()

for val in 0..<10{
    testdot.append(val)
}

print(testdot)
