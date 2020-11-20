//
//  main.swift
//  LeetCode_LongestCommonPrefix
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    var comminPrefix = ""
    if strs.count < 1 {
        return comminPrefix
    }
    let firstStr = strs.first!
    var charArr:[Character] = []
    for c in firstStr {
        charArr.append(c)
    }
    
    for charInedx in 0..<charArr.count {
        for index in 1..<strs.count {
            if strs[index].count <= charInedx {
                return comminPrefix
            }
            let firstIndex = strs[index].index(strs[index].startIndex, offsetBy: charInedx)
            let compareStr = String(strs[index][firstIndex])
            if compareStr != String(charArr[charInedx]) {
                return comminPrefix
            }
        }
        comminPrefix += String(charArr[charInedx])
    }
    return comminPrefix
}

func longestCommonPrefix_good(_ strs: [String]) -> String {
    let count = strs.count
    if  count == 0 {
        return ""
    }
    if count == 1 {
        return strs.first!
    }
    var result = strs.first!
    for i in 1..<count {
        while !strs[i].hasPrefix(result) {
            result = String(result.prefix(result.count - 1))
            if result.count == 0 {
                return ""
            }
        }
    }
    return result
}

print("\(longestCommonPrefix(["dog","racecar","car"]))")

