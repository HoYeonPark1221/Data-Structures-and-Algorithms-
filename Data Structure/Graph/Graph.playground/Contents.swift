import Foundation

struct Graph {
    let size: Int
    private var adjancyList: [[Int]]
    
    init(size: Int) {
        self.size = size
        self.adjancyList = Array(repeating: [], count: size)
    }
    
    mutating func addEdge(from: Int, to: Int) {
        adjancyList[from].append(to)
        adjancyList[to].append(from)
    }
    
    mutating func removeEdge(from: Int, to: Int) {
        adjancyList[from].removeAll { $0 == to }  //from목록에서 to를 제거
        adjancyList[to].removeAll { $0 == from }
    }
    
    func isConnect(from: Int, to: Int) -> Bool {
        return adjancyList[from].contains(to)
    }
    
    func neighbors(of node: Int) -> [Int] {
            return adjancyList[node]
        }

    func printList() {
        for (node, neighbors) in adjancyList.enumerated() {
                print("\(node) → \(neighbors)")
        }
    }
}

var graph = Graph(size: 4)
graph.addEdge(from: 0, to: 1)
graph.addEdge(from: 0, to: 2)
graph.addEdge(from: 1, to: 2)
graph.addEdge(from: 1, to: 3)
graph.addEdge(from: 2, to: 3)
graph.removeEdge(from: 0, to: 1)
graph.printList()
