//
//  Deque_Optimize.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/17.
//

import Foundation

/*
 
 All enqueuing and dequeuing operation are 0(1).
 
 */
    
public struct DequeOptimize<T>{
    private var array: [T?]
    private var head: Int
    private var capacity : Int
    private let originalCapacity: Int
    
    public init(_ capacity : Int = 10){
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty : Bool {
        return array.isEmpty
    }
    
    public var count : Int {
        return array.count
    }
    
    public mutating func enqueue(_ element : T){
        array.append(element)
//        array.insert(element, at: 0)
    }
    
    public mutating func enqueueFront(_ element : T){
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else {return nil}
        
        array[head] = nil
        head += 1
        
        if capacity >= originalCapacity && head >= capacity * 2 {
            let amountToRemove = capacity + capacity / 2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        }
        
        return array.removeLast()
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        }
        
        return array[head]
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        }
        
        return array.last!
    }
}

