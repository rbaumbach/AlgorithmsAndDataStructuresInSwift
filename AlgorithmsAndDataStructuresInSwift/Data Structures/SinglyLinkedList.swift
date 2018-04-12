import Foundation

class SinglyLinkedList {
    // MARK: - Private Properties
    
    private var head: SingleNode?
    
    // MARK: - Public Methods
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> Int? {
        return head?.item
    }
    
    func addToFront(item: Int) {
        head = SingleNode(item: item)
    }
}
