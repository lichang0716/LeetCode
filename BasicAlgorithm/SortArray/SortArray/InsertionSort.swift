//
//  InsertionSort.swift
//  SortArray
//
//  Created by Pwnlc on 2021/3/8.
//

import Foundation

/*
    插入排序
    取后一个元素，依次比较之前已排序好的数组，如果大于则交换位置，否则执行下一个
    时间复杂度：O(n^2)
    空间复杂度：O(1)
    
 */

func insertionSort(_ num:[Int]) -> [Int] {
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
