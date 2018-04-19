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
}
