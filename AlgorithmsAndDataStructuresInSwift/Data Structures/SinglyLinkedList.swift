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
        if let oldHead = head {
            head = SingleNode(item: item)
            head?.nextNode = oldHead
        } else {
            head = SingleNode(item: item)
        }
    }
    
    func removeFromFront() -> Int? {
        guard let oldHead = head else {
            return nil
        }
        
        let oldHeadItem = oldHead.item
        
        head = oldHead.nextNode
        
        return oldHeadItem
    }
    
    func addToBack(item: Int) {
        if let tailNode = findTailNode() {
            tailNode.nextNode = SingleNode(item: item)
        } else {
            head = SingleNode(item: item)
        }
    }
    
    func removeFromBack() -> Int? {
        guard let head = head else {
            return nil
        }
        
        if head.nextNode == nil {
            return head.item
        }
        
        let newTailNode: SingleNode = findNodeImmediatelyBeforeTailNode()
        let oldTailNode: SingleNode? = newTailNode.nextNode

        newTailNode.nextNode = nil

        return oldTailNode?.item
    }
    
    // MARK: - Private Methods
    
    private func findTailNode() -> SingleNode? {
        guard let head = head else {
            return nil
        }

        var currentNode: SingleNode? = head

        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }

        return currentNode
    }
    
    private func findNodeImmediatelyBeforeTailNode() -> SingleNode {
        var currentNode: SingleNode? = head

        while currentNode?.nextNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }

        return currentNode!
    }
}
