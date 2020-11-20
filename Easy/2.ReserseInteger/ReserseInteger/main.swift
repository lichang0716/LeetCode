//
//  main.swift
//  LeetCode_ReserseInteger
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/reverse-integer/
// 给定一个 32 位有符号整数，将整数中的数字进行反转。

func reverse_good(_ x: Int) -> Int {
	// 遍历取余
	var p = x
	var result = 0
	while p != 0 {
		result = result * 10 + p % 10
		p /= 10
	}
	if result > Int32.max || result < Int32.min {
		return 0
	}
	return result
}


func reverse_bad(_ x: Int) -> Int {
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

func reverse_trick(_ x: Int) -> Int {
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

print("\(reverse_good(-14236469))")
print("\(reverse_bad(1534236469))")
print("\(reverse_trick(1534236469))")

