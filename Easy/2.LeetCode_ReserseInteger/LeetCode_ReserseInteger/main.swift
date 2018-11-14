//
//  main.swift
//  LeetCode_ReserseInteger
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

// 给定一个 32 位有符号整数，将整数中的数字进行反转。

func reverse_mine(_ x: Int) -> Int {
    let stringX = "\(x)"
    var finalStr = ""
    var isSmallThanZero = false;
    for index in 0..<stringX.count {
        let charIndex = stringX.index(stringX.startIndex, offsetBy: index)
        let char = stringX[charIndex]
        if char == "-" {
            isSmallThanZero = true
            finalStr.append(char)
        } else {
            let offSet = isSmallThanZero ? 1 : 0
            let nowIndex = finalStr.index(finalStr.startIndex, offsetBy: offSet)
            finalStr.insert(char, at: nowIndex)
        }
    }
    
    var n: Int = 0
    if let number = Int(finalStr) {
        if number <= Int32.max && number >= Int32.min {
            n = number
        }
    }
    return n;
}

func reverse_normal(_ x: Int) -> Int {
    var stringX = "\(x)"
    var isSmallThanZero = false;
    if x < 0 {
        isSmallThanZero = true;
        stringX.removeFirst()
    }
    var reverseStr = String(stringX.reversed())
    if isSmallThanZero {
        reverseStr = "-"+reverseStr
    }
    if let reverseInt = Int(reverseStr), reverseInt <= Int32.max, reverseInt >= Int32.min {
        return reverseInt
    }
    return 0
}

func reverse_good(_ x: Int) -> Int {
    
    var p = x
    var result = 0
    while p != 0 {
        if result > Int32.max/10 || (result == Int32.max/10 && p % 10 > 7) {
            return 0;
        }
        if result < Int32.min/10 || (result == Int32.min/10 && p % 10 < -8) {
            return 0;
        }
        result = result * 10 + p % 10
        p /= 10
    }
    return result
}

print("\(reverse_mine(1534236469))")
print("\(reverse_normal(1534236469))")
print("\(reverse_good(-14236469))")
