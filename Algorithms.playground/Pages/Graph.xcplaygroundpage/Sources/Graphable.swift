
public protocol Graphable {
    associatedtype Element: Hashable // 1
    var description: CustomStringConvertible { get } // 2
    
    func createVertex(data: Element) -> Vertex<Element> // 3
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) // 4
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
        var visits: [Vertex<Element> : Visit<Element>] = [source: .source]
        var enqueuedVertices = Set<Vertex<Element>>()
        
        while let visitedVertex = queue.dequeue() { // 2
            if visitedVertex == destination {
                var vertex = destination // 1
                var route: [Edge<Element>] = [] // 2
                
                while let visit = visits[vertex],
                    case .edge(let edge) = visit { // 3
                        
                        route = [edge] + route
                        vertex = edge.source // 4
                        
                }
                return route // 5
            }
            let neighbourEdges = edges(from: visitedVertex) ?? [] // 1
            for edge in neighbourEdges {
                 if visits[edge.destination] == nil {
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            } // 2
        }
        return nil // 4
    }
}

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

