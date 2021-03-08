//
//  main.swift
//  SortArray
//
//  Created by Chang Li on 2021/3/4.
//

import Foundation

let array = [2, 1, 4, 5, 7, 6, 0, 3]

print(array)

print("bubble sort:\(bubbleSort(array))")

print("selection sort:\(selectionSort(array))")

print("quick sort:\(quickSort(array))")

print("insertion sort:\(insertionSort(array))")
