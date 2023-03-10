//
//  Queue_Optimize.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/17.
//

public struct Quque<T>{
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool{
        return count == 0
    }
    
    public var count: Int{
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    public mutating func dequeue() -> T?{
        guard let element = array[guarded: head] else {return nil}
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        
        if array.count > 50 && percentage > 0.25{
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front : T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

// Array extension guarded
extension Array{
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}
