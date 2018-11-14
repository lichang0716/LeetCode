//
//  main.swift
//  LeetCode_PalindromeNumber
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

// 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    let xStr = "\(x)"
    let halfLength = xStr.count % 2 == 0 ? xStr.count/2 : (xStr.count-1)/2
    for index in 0..<halfLength {
        let firstIndex = xStr.index(xStr.startIndex, offsetBy: index)
        let secondIndex = xStr.index(xStr.startIndex, offsetBy: xStr.count - 1 - index)
        if xStr[firstIndex] != xStr[secondIndex] {
            return false
        }
    }
    return true
}

func isPalindrome_good(_ x: Int) -> Bool {
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false
    }
    var num = x
    var revertedNum = 0
    while revertedNum < num {
        revertedNum = revertedNum * 10 + num % 10
        num /= 10
    }
    return num == revertedNum || num == revertedNum / 10
}

print("\(isPalindrome_good(363))")
print("\(isPalindrome_good(-363))")
print("\(isPalindrome_good(0))")
print("\(isPalindrome_good(100))")
print("\(isPalindrome_good(110))")
print("\(isPalindrome_good(11011))")

