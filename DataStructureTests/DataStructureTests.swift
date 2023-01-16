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
}
