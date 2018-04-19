import Foundation

class TreeNode<T: Equatable>: Equatable {
    // MARK: - Public Properties
    
    var item: T
    var children: [TreeNode<T>] = []
    
    // MARK: - Init Method
    
    init(item: T) {
        self.item = item
    }
    
    // MARK: - Public Methods
    
    func add(item: T) {
        children.append(TreeNode<T>(item: item))
    }
    
    func remove(item: T) {
        children = children.filter { treeNode in
            return treeNode.item != item
        }
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        return lhs.item == rhs.item && lhs.children == rhs.children
    }
}
