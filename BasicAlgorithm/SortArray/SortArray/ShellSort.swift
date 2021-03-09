//
//  ShellSort.swift
//  SortArray
//
//  Created by Chang Li on 2021/3/9.
//

import Foundation

/*
	希尔排序
	是插入排序的一种更高效的版本，非稳定排序算法

*/


func insertionSort111(_ num:[Int]) -> [Int] {
	var arr = num;
	for i in 1..<arr.count {
		let tempValue = arr[i]
		for j in (0...i-1).reversed() {
			if arr[j] > tempValue {
				arr[j+1] = arr[j];
				arr[j] = tempValue;
			}
		}
	}
	return arr;
}



func shellSort(_ num:[Int]) -> [Int] {
	var arr = num;
	var d = arr.count / 2;
	while d >= 1 {
		print("d=\(d)")
		doShell(&arr, d: d)
		d = d/2;
	}
	return arr;
}


func doShell(_ arr:inout [Int], d:Int) -> Void {
	// 执行的就是插入排序
	for i in 0..<d {
		print("===================")
		for j in stride(from: i, to: arr.count-d, by: d) {
			print("----------------------")
			for m in stride(from: j+d, to: arr.count, by: d) {
				let tempValue = arr[j];
				print("i=\(i) j=\(j) m=\(m)")
				if arr[m] < tempValue {
					arr[j] = arr[m]
					arr[m] = tempValue
				}
			}
		}
	}
	print(arr)
}
