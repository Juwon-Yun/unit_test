//
//  Stack.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/17.
//

/*
 LIFO
 Push and Pop are O(1) operations
 */

public struct Stack<T>{
    public init(_ array : [T]){
        self.array = array
    }
    
    public var array = [T]()
    
    public var isEmpty: Bool{
        return array.isEmpty
    }
    
    public var count: Int{
        return array.count
    }
    
    public mutating func push(_ element : T){
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
    
}
