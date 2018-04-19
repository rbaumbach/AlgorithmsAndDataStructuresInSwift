import Foundation

class Tree<T: Equatable> {
    // MARK: - Public Properties
    
    var root: TreeNode<T>?
    
    init() { }
    
    init(root: TreeNode<T>) {
        self.root = root
    }
    
    // MARK: - Public Methods
    
    func isEmpty() -> Bool {
        return root == nil
    }
    
    func traverseBreadthFirst() -> [T] {
        guard let rootNode = root else {
            return []
        }
        
        var traversalArray: [TreeNode<T>] = [rootNode]
        
        var breadthFirstArray: [T] = []
        
        while traversalArray.count != 0 {
            let currentNode = traversalArray.removeFirst()
            
            traversalArray += currentNode.children
            
            breadthFirstArray.append(currentNode.item)
        }
        
        return breadthFirstArray
    }
    
    func traverseDepthFirst() -> [T] {
        guard let rootNode = root else {
            return []
        }
        
        var traversalArray: [TreeNode<T>] = [rootNode]
        
        var depthFirstArray: [T] = []
        
        while traversalArray.count != 0 {
            let currentNode = traversalArray.removeFirst()
            
            traversalArray = currentNode.children + traversalArray
            
            depthFirstArray.append(currentNode.item)
        }
        
        return depthFirstArray
    }
}
