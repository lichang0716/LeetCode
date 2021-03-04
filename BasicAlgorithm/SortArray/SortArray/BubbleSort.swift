//
//  BubbleSort.swift
//  SortArray
//
//  Created by Chang Li on 2021/3/4.
//

import Foundation

/*
	冒泡排序
	原理：遍历相邻两个元素，大的后移；前移的话，比较顺序相反
	步骤：0轮：比较01，比较12，比较23，比较34
		 1轮：比较01，比较12，比较23
		 2轮：比较01，比较12，
		 3轮：比较01

	时间复杂度：O(n^2)
	空间复杂度：O(1)

*/

func bubbleSort(_ nums:[Int]) -> [Int] {
	var targetArr = nums;
	for i in 0..<targetArr.count - 1 {
		for j in 0..<targetArr.count - i - 1 {
			let temp = targetArr[j]
			if targetArr[j] > targetArr[j+1] {
				targetArr[j] = targetArr[j+1]
				targetArr[j+1] = temp
			}
		}
	}
	return targetArr
}
