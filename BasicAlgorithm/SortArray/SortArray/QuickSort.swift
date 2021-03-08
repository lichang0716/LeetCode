//
//  QuickSort.swift
//  SortArray
//
//  Created by Pwnlc on 2021/3/8.
//

import Foundation


/*
    快速排序
    选定一个下标，一次循环，小的移动到左侧，大的移动到右侧，循环完毕，所得位置就是该下标对应的真实位置
    然后递归计算前半部分和后半部分数据，最后得出排序之后的数据
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
 
 */
func quickSort(_ num:[Int]) -> [Int] {
    var arr = num;
    getRealPosition(&arr, leftIndex: 0, rightIndex: arr.count - 1);
    return arr;
}

func getRealPosition(_ num:inout[Int], leftIndex:Int, rightIndex:Int) -> Void {
    if leftIndex < rightIndex {
        let position = calculateRealPosition(&num, leftIndex: leftIndex, rightIndex: rightIndex);
        getRealPosition(&num, leftIndex: leftIndex, rightIndex: position-1);
        getRealPosition(&num, leftIndex: position+1, rightIndex: rightIndex);
    }
}

func calculateRealPosition(_ num:inout[Int], leftIndex:Int, rightIndex:Int) -> Int {
    var temp = leftIndex;
    var left = leftIndex;
    var right = rightIndex;
    while left < right {
        let tempValue = num[temp];
        if left < right && tempValue <= num[right] {
            right = right - 1;
        }
        if left < rightIndex {
            num[temp] = num[right];
        }
        if left < right && tempValue >= num[left] {
            left = left + 1;
        }
        if left < right {
            num[right] = num[left];
        }
        temp = left;
        num[left] = tempValue;
    }
    return temp;
}


