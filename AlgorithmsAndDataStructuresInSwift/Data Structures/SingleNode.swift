import Foundation

class SingleNode: Equatable {
    // MARK: - Public Properties
    
    var item: Int = 0
    var nextNode: SingleNode?
    
    // MARK: - Init Methods
    
    init() { }
    
    init(item: Int) {
        self.item = item
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: SingleNode, rhs: SingleNode) -> Bool {
        return lhs.item == rhs.item && lhs.nextNode == rhs.nextNode
    }
}
