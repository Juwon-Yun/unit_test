//
//  Queue.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/16.
//

public struct Queue<T> {
    public init(_ element : [T]){
        array = element
    }
    
  public var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }

  public var front: T? {
    return array.first
  }
}
