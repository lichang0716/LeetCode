//
//  main.swift
//  LeetCode_SearchInsertPosition
//
//  Created by Chang Li on 2018/11/16.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for (index, ele) in nums.enumerated() {
        if ele >= target {
            return index
        } else if index == nums.count - 1 {
            return index + 1
        }
    }
    return 0
}

func searchInset_erFen(_ nums: [Int], _ target: Int) -> Int {
    var lowerBound = 0
    var upperBound = nums.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound)/2
        if nums[midIndex] == target {
            return midIndex
        } else if nums[midIndex] < target {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return 0
}

