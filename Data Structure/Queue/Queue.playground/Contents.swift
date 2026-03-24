import Foundation

public struct Queue<T> {
    fileprivate var list = SingleLinkedList<T>()

    public var isEmpty: Bool {
        return list.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        list.append(element)
    }

    public mutating func dequeue() -> T? {
        return list.removeFirst()  
    }

    public func peek() -> T? {
        return list.first?.data  
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        var result: [String] = []
        var current = list.first
        while let node = current {
            result.append("\(node.data)")
            current = node.next
        }
        return "[" + result.joined(separator: ", ") + "]"
    }
}
