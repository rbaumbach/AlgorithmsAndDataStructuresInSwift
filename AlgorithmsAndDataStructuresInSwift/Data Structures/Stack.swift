import Foundation

class Stack {
    // MARK: - Private Properties
    
    private var linkedList: LinkedList = SinglyLinkedList()
    
    // MARK: - Public Methods
    
    func push(item: Int) {
        linkedList.addToFront(item: item)
    }
    
    func pop() -> Int? {
        return linkedList.removeFromFront()
    }
    
    func peek() -> Int? {
        return linkedList.peek()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func clear() {
        linkedList = SinglyLinkedList()
    }
}
