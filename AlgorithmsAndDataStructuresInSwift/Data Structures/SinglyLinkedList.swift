import Foundation

class SinglyLinkedList: LinkedList, CustomStringConvertible {
    // MARK: - Private Properties
    
    private var head: SingleNode?
    
    // MARK: - <CustomStringConvertible>
    
    var description: String {
        guard head != nil else {
            return "nil"
        }
        
        return constructStringRepresentation()
    }
    
    // MARK: - Public Methods
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> Int? {
        return head?.item
    }
    
    func clear() {
        head = nil
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
        if head == nil {
            head = SingleNode(item: item)
            
            return
        }
        
        let tailNode = findTailNode()
        
        tailNode.nextNode = SingleNode(item: item)
    }
    
    func addToBackRecursively(item: Int) {
        if let head = head {
            addToBackRecursively(item: item, currentNode: head)
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
    
    func removeFromBackRecursively() -> Int? {
        guard let head = head else {
            return nil
        }
        
        if head.nextNode == nil {
            return head.item
        }
        
        return removeFromBackRecursively(currentNode: head)
    }
    
    func toArray(isAscending: Bool = false) -> [Int] {
        guard head != nil else {
            return []
        }
        
        var generatedArray: [Int] = []
        
        forEach { item in
            generatedArray.append(item)
        }

        if isAscending {
            generatedArray.reverse()
        }
        
        return generatedArray
    }
    
    func forEach(_ body: (Int) -> Void) {
        guard let head = head else {
            return
        }
        
        var currentNode: SingleNode? = head
        
        while currentNode != nil {
            body(currentNode!.item)
            
            currentNode = currentNode?.nextNode
        }
    }
    
    // MARK: - Private Methods
    
    private func findTailNode() -> SingleNode {
        var currentNode: SingleNode? = head

        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }

        return currentNode!
    }
    
    private func findNodeImmediatelyBeforeTailNode() -> SingleNode {
        var currentNode: SingleNode? = head

        while currentNode?.nextNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }

        return currentNode!
    }
    
    private func constructStringRepresentation() -> String {
        var stringRepresentation = ""
        
        forEach { item in
            stringRepresentation += "|\(item)| -> "
        }
        
        stringRepresentation += "nil"
        
        return stringRepresentation
    }

    private func addToBackRecursively(item: Int,  currentNode: SingleNode) {
        if currentNode.nextNode == nil {
            currentNode.nextNode = SingleNode(item: item)
            
            return
        }
        
        addToBackRecursively(item: item, currentNode: currentNode.nextNode!)
    }
    
    private func removeFromBackRecursively(currentNode: SingleNode) -> Int {
        if currentNode.nextNode?.nextNode == nil {
            let tailItem = currentNode.nextNode!.item
            
            return tailItem
        }
        
        return removeFromBackRecursively(currentNode: currentNode.nextNode!)
    }
}
