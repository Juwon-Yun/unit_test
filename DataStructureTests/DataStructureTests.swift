//
//  DataStructureTests.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/16.
//

import Foundation
import XCTest
@testable import DataStructure

class QueueTest: XCTestCase{
    func testEmpty() -> Void {
        var queue = Queue<Int>([])
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
        XCTAssertNil(queue.dequeue())
    }
    
    func testOneElement() -> Void{
        var queue  = Queue<Int>([])
        queue.enqueue(1)
        
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.front, nil)
        XCTAssertEqual(queue.count, 0)
        
        queue.enqueue(2)
        
        let result = queue.dequeue()
        
        XCTAssertEqual(result , 2)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
}
