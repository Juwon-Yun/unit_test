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
     반복문으로 노드 순회함. (bottom-up)
     */
    private mutating func configureHeap(from array:[T]){
        nodes = array
        for i in stride(from: (nodes.count / 2 - 1), through: 0,by: -1){

        }
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
    
    /*
     @inline, @inlinable
     컴파일러 최적화에 사용
     메소드 호출을 해당 메소드의 본문을 대체하는 컴파일러 최적화 방법.
     
     일반적인 호출 예 : 추적, 앱 상태 전송, 저장, 변경 등.
     장점 - 디버깅이 용이, 단점 - 오버헤드
     
     인라인을 사용한 경우의 메소드 호출
     스택을 따로 추적하지 않고 메소드의 본문을 바로 가져다 사용함.
     장점 - 오버헤드 감소, 단점 - 함수가 재귀 함수인 경우 오히려 비효율적임.
     
     */
    @inline(__always) internal func parentIndex(ofIndex i : Int) -> Int {
        return (i - 1) / 2
    }
    
    internal mutating func shiftUp(_ idx : Int){
        let childIndex = idx
        let child = nodes[childIndex]
//        var parentIndex = parentIndex(ofindex)
    }
    
}

