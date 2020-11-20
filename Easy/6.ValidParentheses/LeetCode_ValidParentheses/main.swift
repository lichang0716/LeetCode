//
//  main.swift
//  LeetCode_ValidParentheses
//
//  Created by Chang Li on 2018/11/14.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

/*
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 */

func isValid(_ s: String) -> Bool {
    if s.count == 0 {
        return true
    } else if s.count % 2 != 0 {
        return false
    }
    
    if String(s.prefix(1)) == ")" || String(s.prefix(1)) == "}" || String(s.prefix(1)) == "]" {
        return false
    }
    
    let leftParentheses: [String] = ["()", "{}", "[]"]
    var hasDoubleParenthese = false
    for index in 0..<leftParentheses.count {
        if s.contains(leftParentheses[index]) {
            hasDoubleParenthese = true
            break
        }
    }
    if hasDoubleParenthese == false {
        return false
    } else if s.count == 2 {
        return true
    }
    
    var str = s
    while str.count >= 2 {
        let nowLength = str.count
        for index in 0..<leftParentheses.count {
            while str.contains(leftParentheses[index]) {
                if let indexOfSymbols = str.range(of: leftParentheses[index]) {
                    str.removeSubrange(indexOfSymbols)
                }
            }
        }
        if str.count == nowLength {
            return false
        }
    }
    return str.count == 0
}


func isValid_good(_ s: String) -> Bool {
    if s.isEmpty {
        return true
    }
    var stack = [Character]()
    for char in s {
        if char == "(" {
            stack.append(")")
        } else if char == "{" {
            stack.append("}")
        } else if char == "[" {
            stack.append("]")
        } else if stack.isEmpty || stack.removeLast() != char {
            return false
        }
    }
    return stack.isEmpty
}

print("\(isValid_good("[(({})}]"))")

