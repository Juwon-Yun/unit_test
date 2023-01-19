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
    
    // index i를 인자로 받아 요소의 부모 인덱스를 반환함.
    @inline(__always) internal func parentIndex(ofIndex i : Int) -> Int {
        return (i - 1) / 2
    }
    
    // index i를 인자로 받아 요소의 왼쪽 노드 자식을 반환함.
    // 왼쪽 노드 자식이 없는 경우 힙의 크기보다 더 큰 값을 반환함.
    @inline(__always) internal func leftChildIndex(ofIndex i : Int) -> Int {
        return 2 * i + 1
    }
    
    // index i를 인자로 받아 요소의 오른쪽 자식 노드를 반환함.
    // 오른쪽 노드 자식이 없는 경우 힙의 크기보다 더 큰 값을 반환함.
    @inline(__always) internal func rightChildIndex(ofIndex i : Int) -> Int{
        return 2 * i + 2
    }
    
    /*
     자식 노드를 가져와 max-heap(부모가 더 작은 경우) 또는 min-heap(자식보다 작지 않은 경우)인 경우에 교환함.
     */
    internal mutating func shiftUp(_ idx : Int){
        var childIndex = idx
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]){
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    /*
     부모 노드롤 보고 max-heap(자식 노드 보다 더 큼)인지 min-heap(자식 노드 보다 더 작음)인지 구별함.
     */
    internal mutating func shiftDown(from index: Int, until endIndex: Int){
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = self.rightChildIndex(ofIndex: index)
        
        /*
         정렬 함수로 힙의 부모 노드, 왼쪽 자식, 오른쪽 자식을 정렬함.
        
         부모 노드가 첫번째로 올떄까지 돌림.
         
         아닌 경우, 노드들을 가만히 안냅두고 힙이 원하는 대로 정렬될 때까지 "float down" 함.
        
         */
        var first = index
        
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]){
            first = leftChildIndex
        }
        
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]){
            first = rightChildIndex
        }
        
        if first == index {return}
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int){
        shiftDown(from: index, until: nodes.count)
    }
    
    /*
     max-heap인 경우 가장 큰 노드를 반환함.
     min-heap인 경우 가장 작은 노드를 반환함.
     */
    public func peek() -> T?{
        return nodes.first
    }
    
    /*
     새 노드를 힙에 저장하는데, max-heap 또는 min-heap이 유지되도록 재정렬함.
     성능은 O(log n)
     */
    public mutating func insert(_ value : T){
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    /*
      인자가 반복가능한 타입인 경우에 반복문으로 힙에 저장함.
      max, min-heap 속성은 유지함.
      성능은 O(log n).
     */
    public mutating func insert<S : Sequence>(_ sequence : S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    /*
     @discardableResult
     xcode에서 여러가지 warning을 띄워주는데, 특히 var 또는 let을 선언하고 사용하지 않는 경우.
     예시로 컴파일러에게 변수가 사용안되어도 신경쓰지 마라는 의미로 사용함.
     해당 함수에서 warning을 제거하는 키워드 또는 문구.
    */
    
    /*
     힙에서 루트 노트를 제거함. max-heap에선 최대값 노드를 제거, min-heap에선 최솟값 노드를 제거.
     성능은 O(log n)
     */
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else {return nil}
        
        if nodes.count == 1{
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    /*
     힙에서 해당 인자를 제거함.
     해당 인자의 인덱스를 알아야한다.
     성능은 O(log n)
     */
    @discardableResult public mutating func remove(at index: Int) -> T?{
        guard index < nodes.count else {return nil}
        
        let size = nodes.count - 1
        if index != size{
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    public mutating func replace(index i : Int, value : T){
        guard i < nodes.count else {return}
        remove(at: i)
        
    }
}

