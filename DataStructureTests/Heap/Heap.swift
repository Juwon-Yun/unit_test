//
//  Heap.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/18.
//

import Foundation

/*
  힙의 노드를 저장할 배열을 만듬.
 */

public struct Heap<T>{
    
    public init(_ array : [T], sort: @escaping (T, T) -> Bool){
        nodes = array
        orderCriteria = sort
    }
    
    private var nodes = [T]()
    
    private var orderCriteria : (T, T) -> Bool
    
}

