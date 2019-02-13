//
//  main.swift
//  LeetCode_MergeTwoSortedLists
//
//  Created by Chang Li on 2018/11/15.
//  Copyright © 2018 pwnlc. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
     }
}

let listNode = ListNode(1)


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else {
        return l2
    }
    
    guard let l2 = l2 else {
        return l1
    }
    
    if l1.val >= l2.val {
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
        
    } else {
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    }
}
