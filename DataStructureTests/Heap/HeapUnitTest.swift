//
//  HeapUnitTest.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/23.
//

import Foundation
import XCTest

class HeapTest : XCTestCase{
    
    fileprivate func verifyMaxHeap(_ heap : Heap<Int>) -> Bool{
        for i in 0..<heap.nodes.count {
            let left = heap.leftChildIndex(ofIndex: i)
            let right = heap.rightChildIndex(ofIndex: i)
            let parent = heap.parentIndex(ofIndex: i)
            
            if left < heap.nodes.count && heap.nodes[i] < heap.nodes[left] {return false}
            if right < heap.nodes.count && heap.nodes[i] < heap.nodes[right] {return false}
            if i > 0 && heap.nodes[parent] < heap.nodes[i] {return false}
        }
        return true
    }
}
