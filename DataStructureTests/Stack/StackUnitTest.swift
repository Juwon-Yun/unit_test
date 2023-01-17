//
//  StackUnitTest.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/17.
//

import Foundation
import XCTest
@testable import DataStructure

class StackTest: XCTestCase{
    
    func testEmpty() -> Void{
        var stack = Stack<Int>([])
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
        XCTAssertEqual(stack.top, nil)
        XCTAssertNil(stack.pop())
    }
    
    func testOneElement(){
        var stack = Stack<Int>([])
        stack.push(1)
        
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(stack.top, 1)
        
        let result = stack.pop()
        XCTAssertEqual(result, 1)
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
        XCTAssertEqual(stack.top, nil)
        XCTAssertNil(stack.pop())
    }
    
    func testTwoElement(){
        var stack = Stack<Int>([])
        stack.push(2)
        stack.push(3)
        
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(stack.top, 3)
        
        let result = stack.pop()
        XCTAssertEqual(result, 3)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(stack.top, 2)
    }
    
    func testMakeEmpty(){
        var stack = Stack<Int>([])
        stack.push(4)
        stack.push(5)
        
        XCTAssertNotNil(stack.pop())
        XCTAssertNotNil(stack.pop())
        XCTAssertNil(stack.pop())
        
        stack.push(6)
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(stack.pop(), 6)
        XCTAssertNil(stack.pop())
        XCTAssertEqual(stack.count, 0)
    }
    
}
