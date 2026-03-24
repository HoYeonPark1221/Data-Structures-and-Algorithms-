import Foundation


public class Node<T> {
    public var data: T
    public var next: Node<T>?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


public class SingleLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(_ data: T) {
        let newNode = Node(data)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func addFirst(_ data: T) {
        let newNode =  Node(data)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        
    }
    
    public func printAll() {
        var current = head        
        while let node = current {
            print(node.data)
            current = node.next   
        }
    }   
    
    public func removeFirst() -> T? {
        if isEmpty { return nil }
        
        let value = head?.data
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        return value
    }
    
    public func removeLast() -> T? {
        if isEmpty { return nil }
        
        // 노드가 1개인 경우
        if head === tail {
            let value = head?.data
            head = nil
            tail = nil
            return value
        }
        
        // 2개 이상인 경우 → tail 직전 노드를 찾아야 함
        var current = head
        while current?.next !== tail {  // tail 직전 노드까지 순회
            current = current?.next
        }
        
        let value = tail?.data
        current?.next = nil  // tail 연결 끊기
        tail = current       // tail을 직전 노드로 업데이트
        
        return value
    }
    
    public func node(at index: Int) -> T? {
        if index < 0 { return nil }
        
        var current = head
        var i = 0
        
        while i < index {
            if current == nil { return nil }  
            current = current?.next
            i += 1
        }
        return current?.data
    }
    
    public func reverse() {
        var prev: Node<T>? = nil
        var current = head
        tail = head  // 기존 head가 새로운 tail
        
        while current != nil {
            let next = current?.next 
            current?.next = prev
            prev = current           
            current = next
        }
        head = prev
    }
}

