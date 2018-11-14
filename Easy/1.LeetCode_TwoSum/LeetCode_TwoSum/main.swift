//
//  main.swift
//  LeetCode_TwoSum
//
//  Created by Chang Li on 2018/11/13.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

func twoSum_bad(_ nums: [Int], _ target: Int) -> [Int] {
    for firstIndex in 0..<nums.count - 1 {
        for secondIndex in firstIndex..<nums.count {
            if nums[firstIndex] + nums[secondIndex] == target {
                return [firstIndex, secondIndex];
            }
        }
    }
    return []
}

func twoSum_good(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dic = [Int: Int]()
    for index in 0..<nums.count {
        if let secondIndex = dic[target - nums[index]] {
            return [secondIndex, index]
        } else {
            dic[nums[index]] = index
        }
    }
    return []
}

let array = [2, 7, 9, 1]

print("twoSum_bad: \(twoSum_bad(array, 10))")

print("twoSum_good: \(twoSum_good(array, 10))")
