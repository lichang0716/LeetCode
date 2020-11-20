//
//  main.swift
//  LeetCode_RemoveElement
//
//  Created by Chang Li on 2018/11/15.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    var i = 0
    while i < nums.count {
        if nums[i] == val {
            nums.remove(at: i)
        } else {
            i += 1
        }
    }
    return nums.count
}

