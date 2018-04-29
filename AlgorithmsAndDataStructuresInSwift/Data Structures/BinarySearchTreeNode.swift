import Foundation

class BinarySearchTreeNode<T: Equatable, U: Equatable>: Equatable {
    // MARK: - Public Properties
    
    var key: T
    var value: U
    
    var leftChildNode: BinarySearchTreeNode<T, U>?
    var rightChildNode: BinarySearchTreeNode<T, U>?
    
    // MARK: - Init Method
    
    init(key: T, value: U) {
        self.key = key
        self.value = value
    }
    
    // MARK: - Equatable
    
    static func == (lhs: BinarySearchTreeNode<T, U>, rhs: BinarySearchTreeNode<T, U>) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value &&
               lhs.leftChildNode == rhs.leftChildNode && lhs.rightChildNode == rhs.rightChildNode
    }
}
