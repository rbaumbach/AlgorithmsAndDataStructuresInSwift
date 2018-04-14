import Foundation

class Stack<T: Equatable> {
    // MARK: - Private Properties
    
    private var linkedList = GenericSinglyLinkedList<T>()
    
    // MARK: - Public Methods
    
    func push(item: T) {
        linkedList.addToFront(item: item)
    }
    
    func pop() -> T? {
        return linkedList.removeFromFront()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func clear() {
        linkedList.clear()
    }
}
