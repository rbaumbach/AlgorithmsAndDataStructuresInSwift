import Foundation

class DoublyLinkedList {
    // MARK: - Private Properties
    
    private var head: DoubleNode?
    private var tail: DoubleNode?
    
    // MARK: - Public Methods
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> Int? {
        return head?.item
    }
    
    func peekAtBack() -> Int? {
        return tail?.item
    }
    
    func addToFront(item: Int) {
        if let oldHead = head {
            let newHead = DoubleNode(item: item)
            newHead.nextNode = oldHead
            
            oldHead.previousNode = newHead
            
            head = newHead
        } else {
            head = DoubleNode(item: item)
            tail = head
        }
    }
    
    func removeFromFront() -> Int? {
        guard let oldHead = head else {
            return nil
        }
        
        let oldHeadItem = oldHead.item

        head = oldHead.nextNode
        head?.previousNode = nil

        oldHead.nextNode = nil
        
        return oldHeadItem
    }
    
    func addToBack(item: Int) {
        if let oldTail = tail {
            let newTail = DoubleNode(item: item)
            newTail.previousNode = oldTail
            
            oldTail.nextNode = newTail
            
            tail = newTail
        } else {
            head = DoubleNode(item: item)
            tail = head
        }
    }
    
    func removeFromBack() -> Int? {
        guard let oldTail = tail else {
            return nil
        }
        
        let oldTailItem = oldTail.item
        
        tail = oldTail.previousNode
        tail?.nextNode = nil

        oldTail.previousNode = nil
        
        return oldTailItem
    }
}
