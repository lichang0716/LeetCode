//
//  SelecctionSort.swift
//  SortArray
//
//  Created by Chang Li on 2021/3/4.
//

import Foundation

/*
	选择排序
	每次循环找到最小的 index 和 当前 index 进行交换

	时间复杂度 O(n^2)
	空间复杂度 O(1)
*/

func selectionSort(_ num:[Int]) -> [Int] {
	var arr = num
	var minIndex:Int
	for i in 0..<arr.count-1 {
		minIndex = i
		for j in i+1...arr.count-1 {
			if arr[j] < arr[minIndex] {
				minIndex = j
			}
		}
		let temp = arr[i];
		arr[i] = arr[minIndex]
		arr[minIndex] = temp
	}
	return arr
}
