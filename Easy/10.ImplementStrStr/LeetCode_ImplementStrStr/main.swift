//
//  main.swift
//  LeetCode_ImplementStrStr
//
//  Created by Chang Li on 2018/11/15.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func strStr_systemMethod(_ hayStack: String, _ needle: String) -> Int {
    if needle.count == 0 {
        return 0
    }
    
    let arr = hayStack.components(separatedBy: needle)
    
    if arr.first!.count == hayStack.count {
        return -1
    }
    
    return arr.first!.count
}

func strStr_littleTrick(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty {
        return 0
    }
    
    if haystack.count <= needle.count {
        if haystack == needle {
            return 0
        } else {
            return -1
        }
    }
    
    for index in 0...(haystack.count-needle.count) {
        let partStr = haystack[haystack.index(haystack.startIndex, offsetBy: index)..<haystack.index(haystack.startIndex, offsetBy: index + needle.count)]
        if partStr == needle {
            return index
        }
    }
    
    return -1
}

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count == 0 {
        return 0
    }
    
    for (index, char) in haystack.enumerated() {
        if char == needle.first! {
            
            if needle.count == 1 {
                return index
            }

            var curr = index
            for j in 1..<needle.count {
                curr += 1
                if curr < haystack.count {
                    let needleChar = needle[needle.index(needle.startIndex, offsetBy: j)]
                    let haystackChar = haystack[haystack.index(haystack.startIndex, offsetBy: curr)]
                    
                    if needleChar != haystackChar{
                        break
                    } else if j == needle.count - 1 {
                        return index
                    }
                    
                } else {
                    return -1
                }
            }
        }
    }
    return -1
}

func strStr_KMP(_ haystack: String, _ needle: String) -> Int {
    if needle.count == 0 {
        return 0
    }
    
    var hCharArr: [Character] = []
    for (_, char) in haystack.enumerated() {
        hCharArr.append(char)
    }
    
    var nCharArr: [Character] = []
    for (_, char) in needle.enumerated() {
        nCharArr.append(char)
    }
    
    var i = 0
    var j = 0
    
    let next = getNext(needle)
    
    while i < haystack.count && j < needle.count {
        if j == -1 || hCharArr[i] == nCharArr[j] {
            i += 1
            j += 1
        } else {
            j = next[j]
        }
    }
    
    if j == needle.count {
        return i - j
    } else {
        return -1
    }
}

func getNext(_ ps: String) -> [Int] {
    var p: [Character] = []
    for (_, char) in ps.enumerated() {
        p.append(char)
    }
    
    var nextArr = Array(repeating: 0, count: p.count)
    nextArr[0] = -1
    
    var j = 0
    var k = -1
    
    while j < p.count - 1 {
        if k == -1 || p[j] == p[k] {
            j += 1
            k += 1
            nextArr[j] = k
        } else {
            k = nextArr[k]
        }
    }
    return nextArr
}

let b = "pi"

let a = "mississippi"

print("\(strStr_littleTrick(a, b))")

