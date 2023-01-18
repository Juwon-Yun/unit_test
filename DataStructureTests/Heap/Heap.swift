//
//  Heap.swift
//  DataStructureTests
//
//  Created by 윤주원 on 2023/01/18.
//

import Foundation



public struct Heap<T>{
    /*
     sort로 min-heap, max-heap을 정함.
     빈 힙임.
     */
    public init(sort: @escaping (T, T) -> Bool){
        orderCriteria = sort
    }
    /*
     오버로딩
     배열로 인자를 받아서 힙을 만듬. 배열의 순서는 상관없음.
     sort 함수로 배열의 요소의 순서를 정함.
     비교 가능한 타입으로 '>'는 max-heap, '<'은 min-heap.
     */
    public init(array : [T], sort: @escaping (T, T) -> Bool){
        nodes = array
        orderCriteria = sort
    }
    
    /*
      힙의 노드를 저장할 배열을 만듬.
     */
    var nodes = [T]()
    
    /*
     힙안의 두 개이상의 노드를 정렬하기 위한 결정자
      '>'는 max-heap, '<'는 min-heap
      또는, 튜플에 커스텀 비교(정렬) 방법을 제공한다.
     */
    private var orderCriteria : (T, T) -> Bool
    
    
    
}

