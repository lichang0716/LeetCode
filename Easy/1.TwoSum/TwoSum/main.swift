//
//  main.swift
//  LeetCode_TwoSum
//
//  Created by Chang Li on 2018/11/13.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

/*
https://leetcode-cn.com/problems/two-sum/
*/

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
    // 使用字典记录下遍历过的 value 和 index
    var dic = [Int: Int]()
    for index in 0..<nums.count {
		// 如果可以在字典中找到 target 与当前 index 对应 value 的值，那么直接返回
        if let secondIndex = dic[target - nums[index]] {
            return [secondIndex, index]
        } else {
			// 否则将 value-index 存入字典
            dic[nums[index]] = index
        }
    }
    return []
}

let array = [2, 7, 9, 1]

print("twoSum_bad: \(twoSum_bad(array, 10))")

print("twoSum_good: \(twoSum_good(array, 10))")
