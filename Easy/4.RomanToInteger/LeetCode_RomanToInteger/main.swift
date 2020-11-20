//
//  main.swift
//  LeetCode_RomanToInteger
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

extension Character {
    var asRoman: Int {
        var result = 0
        switch self {
        case "I":
            result = 1
        case "V":
            result = 5
        case "X":
            result = 10
        case "L":
            result = 50
        case "C":
            result = 100
        case "D":
            result = 500
        case "M":
            result = 1000
        default:
            break
        }
        return result
    }
}

func romanToInt(_ s: String) -> Int {
    
    let singleDic:[String: Int] = ["I":1,
                                   "V":5,
                                   "X":10,
                                   "L":50,
                                   "C":100,
                                   "D":500,
                                   "M":1000]
    
    let doubleDic:[String: Int] = ["IV":4,
                                   "IX":9,
                                   "XL":40,
                                   "XC":90,
                                   "CD":400,
                                   "CM":900]
    
    var result = 0;
    var index = 0;

    var charArr:[Character] = []
    for c in s {
        charArr.append(c)
    }
    
    while index < charArr.count {
        let singleStr = String(charArr[index])
        if index < charArr.count - 1 {
            let doubleChar = String(charArr[index]) + String(charArr[index + 1])
            if let value = doubleDic[doubleChar] {
                result += value;
                index += 2
                continue
            }
        }
        result += singleDic[singleStr]!
        index += 1
    }
    return result;
}


func romanToInt_good(_ s: String) -> Int {
    var result = 0, last = 0
    for (_, char) in s.enumerated() {
        let curr = char.asRoman
        let sign = curr > last ? -1 : 1
        result += sign * last
        last = curr
    }
    
    result += last
    return result
}

print("\(romanToInt_good("LVIII"))")

