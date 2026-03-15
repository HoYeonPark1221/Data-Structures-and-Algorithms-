import Foundation

public struct Stack<T> {
    
    private var elements = [T]()
    
    //push
    public mutating func push(_ element: T) {
        return elements.append(element)
    }
    
    //pop
    public mutating func pop() -> T? {
        return elements.popLast()
    }
    
    //isEmpty
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    //peek
    public var peek: T? {
        return elements.last
    }
    
    //count
    public var count: Int {
        return elements.count
    }
}
