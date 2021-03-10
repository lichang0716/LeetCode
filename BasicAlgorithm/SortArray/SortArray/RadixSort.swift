//
//  RadixSort.swift
//  SortArray
//
//  Created by Chang Li on 2021/3/10.
//

import Foundation

/*
	基数排序，也叫桶排序
	LSD 最低位优先：适合位数小的数组
	MSD 最高位优先：适合位数大的数组
*/

func radixSort(num:[Int]) -> [Int] {
	var arr = num;
	let maxDigit = maxNumLength(num: num)
	var counter = Array(repeating: [], count: 10)
	
	var mod = 10
	var dev = 1
	
	for _ in 0..<maxDigit {
		
		for j in arr {
			let bucket = j % mod / dev
			if counter[bucket].count < 1 {
				counter[bucket] = []
			}
			counter[bucket].append(j)
		}
		
		dev *= 10
		mod *= 10
		
		var pos = 0
		for m in counter {
			var values = m
			if values.count > 0  {
				while values.count > 0 {
					arr[pos] = values.first as! Int
					values.remove(at: 0)
					pos += 1
				}
			}
		}
		counter = Array(repeating: [], count: 10)
	}
	return arr;
}


func maxNumLength(num:[Int]) -> Int {
	var temp = 0;
	for i in num {
		if i > temp {
			temp = i
		}
	}
	return String(temp).count;
}
