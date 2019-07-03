//
//  main.swift
//  algorithms
//
//  Created by 김현태 on 29/10/2018.
//  Copyright © 2018 onemoon. All rights reserved.
//



//import Foundation

//func solution(_ K:Int, _ user_scores:[String]) -> Int {
//    var result = 0
//    var remainUsers: [(String, Int)] = []
//    for nameScore in user_scores {
//        let temp = (String(nameScore.split(separator: " ")[0]) , Int(nameScore.split(separator: " ")[1])!)
//        remainUsers.append(temp)
//    }
//
//    var sorted_rnk: [(String, Int)] = []
//
//    while sorted_rnk.count == K {
//        var flag = true
//        for (idx,item) in sorted_rnk.enumerated() {
//            if remainUsers[0].0 == item.0 && remainUsers[0].1 > item.1 {
//                sorted_rnk[idx].1 = item.1
//                flag = false
//                break
//            }
//        }
//
//        if flag {
//            sorted_rnk.append(remainUsers[0])
//            remainUsers.remove(at: 0)
//        }
//
//    }
//    sorted_rnk.sort(by: { $0.1 > $1.1 })
//
//    var rnk_names: [String] = []
//    var rnk_scores: [Int] = []
//
//    for _ in 0..<K {
//        rnk_names.append(sorted_rnk[0].0)
//        rnk_scores.append(sorted_rnk[0].1)
//        result += 1
//        sorted_rnk.remove(at: 0)
//    }
//
//    while remainUsers.count != 0 {
//        let newUser = remainUsers[0]
//
//        var alreadyRankerIdx = -1
//        for (idx, rankerName) in rnk_names.enumerated() {
//            if newUser.0 == rankerName {
//                alreadyRankerIdx = idx
//                break
//            }
//        }
//
//        if alreadyRankerIdx != -1 && alreadyRankerIdx != 0 && newUser.1 > rnk_scores[alreadyRankerIdx] {
//            for idx in 0..<alreadyRankerIdx {
//                if rnk_scores[idx] < newUser.1 {
//                    rnk_names.remove(at: alreadyRankerIdx)
//                    rnk_scores.remove(at: alreadyRankerIdx)
//                    rnk_names.insert(newUser.0, at: idx)
//                    rnk_scores.insert(newUser.1, at: idx)
//                    result += 1
//                    break
//                }
//            }
//            rnk_scores[alreadyRankerIdx] = newUser.1
//        } else {
//            for idx in 0..<K {
//                if rnk_scores[idx] < newUser.1 {
//                    rnk_names.insert(newUser.0, at: idx)
//                    rnk_scores.insert(newUser.1, at: idx)
//                    rnk_names.removeLast()
//                    rnk_scores.removeLast()
//                    result += 1
//                    break
//                }
//            }
//        }
//
//        remainUsers.remove(at: 0)
//    }
//
//
//    return result
//
//}
//let temp = ["cheries2 200", "alex111 100", "coco 150", "puyo 120"]
////print(solution(2, temp))
//let temp1 = ["alex111 100", "cheries2 200", "coco 150", "luna 100", "alex111 120", "coco 300", "cheries2 110"]
//
//let temp3 = ["alex111 100", "cheries2 200", "alex111 200", "cheries2 150", "coco 50", "coco 200"]
//
//print(solution(3, temp3))


var hello = "hello"

print(hello)
//var result: NSString = NSString(string: hello)
//var wow = result.character(at: 0)
//
//var result2: NSString = NSString(string: "a")
//var result3: NSString = NSString(string: "A")
//
//print(result2.character(at: 0))
//print(result3.character(at: 0))
//
//
//var new = result.replacingCharacters(in: NSRange(location: 0, length: 1), with: String(Character(UnicodeScalar(wow - 32)!)))
//
//print(new)



