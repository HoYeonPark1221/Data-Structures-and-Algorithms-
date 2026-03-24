import Foundation

public class Node<T> {
    public var data: T
    public var next: Node<T>?
    public var previous: Node<T>?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

public class DoublyLinkedList<T> {
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
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.previous = tail
            tail?.next = newNode
            tail = newNode
        }
    }

    public func addFirst(_ data: T) {
        let newNode = Node(data)
        
        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head?.previous = newNode
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
        
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
            head?.previous = nil
        }
        return value
    }

    public func removeLast() -> T? {
        if isEmpty { return nil }
        
        let value = tail?.data
        
        if head === tail {
            head = nil
            tail = nil
        } else {
            tail = tail?.previous
            tail?.next = nil
        }
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
}
