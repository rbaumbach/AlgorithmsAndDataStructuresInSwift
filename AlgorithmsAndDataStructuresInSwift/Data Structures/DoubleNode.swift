import Foundation

class DoubleNode: Equatable {
    // MARK: - Public Properties
    
    var item: Int = 0
    var previousNode: DoubleNode?
    var nextNode: DoubleNode?
    
    // MARK: - Init Methods
    
    init() { }
    
    init(item: Int) {
        self.item = item
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: DoubleNode, rhs: DoubleNode) -> Bool {
        return lhs.item == rhs.item &&
               lhs.previousNode == rhs.previousNode &&
               lhs.nextNode == rhs.nextNode
    }
}
