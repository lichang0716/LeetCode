//
//  main.swift
//  LeetCode_RemoveDuplicatesFromSortedArray
//
//  Created by Chang Li on 2018/11/15.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var i = 0
    for j in 1..<nums.count {
        if nums[j] != nums[i] {
            i += 1
            nums[i] = nums[j]
        }
    }
    return i+1
}

func removeDuplicates_changed(_ nums: inout [Int]) -> Int {
    var cur: Int?
    var i = 0
    while i < nums.count {
        if cur == nums[i] {
            nums.remove(at: i)
        } else {
            cur = nums[i]
            i += 1
        }
    }
    return nums.count
}


