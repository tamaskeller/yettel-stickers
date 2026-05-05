// Created by ChatGPT, I just needed a graph implementation for the task's purpose
import Foundation

/// Generic graph using adjacency list
final class Graph<Node: Hashable> {

    private var adjacencyList: [Node: Set<Node>] = [:]

    // Add a node
    func addNode(_ node: Node) {
        adjacencyList[node, default: []]
    }

    // Add an undirected edge (A <-> B)
    func addEdge(from source: Node, to destination: Node) {
        adjacencyList[source, default: []].insert(destination)
        adjacencyList[destination, default: []].insert(source)
    }

    // Get neighbors
    func neighbors(of node: Node) -> Set<Node>? {
        adjacencyList[node]
    }

    // Check if two nodes are connected directly
    func isConnected(_ a: Node, _ b: Node) -> Bool {
        adjacencyList[a]?.contains(b) ?? false
    }
}
