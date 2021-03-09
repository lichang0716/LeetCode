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
    当刚开始元素很无序的时候，步长最大，所以插入排序的元素个数很少，速度很快；
    当元素基本有序了，步长很小，插入排序对于有序的序列效率很高。
    时间复杂度：O(nLogn)
    空间复杂度：O(1)

*/


func shellSort(_ num:[Int]) -> [Int] {
	var arr = num;
	var d = arr.count / 2;
	while d >= 1 {
//		print("d=\(d)")
		doShell(&arr, d: d)
		d = d/2;
	}
	return arr;
}


func doShell(_ arr:inout [Int], d:Int) -> Void {
	// 执行的就是插入排序
	for i in 0..<d {
//		print("===================")
		for j in stride(from: i, to: arr.count-d, by: d) {
//			print("----------------------")
			for m in stride(from: j+d, to: arr.count, by: d) {
				let tempValue = arr[j];
//				print("i=\(i) j=\(j) m=\(m)")
				if arr[m] < tempValue {
					arr[j] = arr[m]
					arr[m] = tempValue
				}
			}
		}
	}
//	print(arr)
}
