import Foundation

class GenericSingleNode<T: Equatable>: Equatable {
    // MARK: - Public Properties
    
    var item: T
    var nextNode: GenericSingleNode<T>?
    
    // MARK: - Init Methods
    
    init(item: T) {
        self.item = item
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: GenericSingleNode<T>, rhs: GenericSingleNode<T>) -> Bool {
        return lhs.item == rhs.item && lhs.nextNode == rhs.nextNode
    }
}
