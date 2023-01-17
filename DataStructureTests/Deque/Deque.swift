//
//  Deque.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/17.
//

/*
 Deque (pronounced "deck"), a double-ended queue.
 
 This particular implemaentation is simple but not very efficient.
 Serveral operation ar 0(n).
 A more efficient implementation would use a doubly linked list or a circular buffer.
 
 */

import Foundation

public struct Deque<T>{
    public init(_ array : [T]){
        self.array = array
    }
    
    private var array = [T]()
    
    public var isEmpty:Bool{
        return array.isEmpty
    }
    
    public var count : Int{
        return array.count
    }
    
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element : T){
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty{
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public mutating func dequeueBack() -> T?{
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
        
    public func peekFront() -> T? {
        return array.first
    }
    
    public func peekBack() -> T? {
        return array.last
    }
}
