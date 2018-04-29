import Foundation

class ResizableArray {
    // MARK: - Read only Properties
    
    private(set) var backingArray: [Int?] = Array(repeating: nil, count: 1)
    
    private(set) var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }

    // MARK: - Init Methods
    
    init() { }
    
    init(capacity: Int) {
        backingArray = Array(repeating: nil, count: capacity)
    }
    
    // MARK: - Public Methods
    
    func getItem(index: Int) -> Int? {
        guard index < count else {
            return nil
        }
        
        return backingArray[index]
    }
    
    func append(item: Int) {
        growUnderlyingArrayIfNecessary()
        
        backingArray[count] = item
        
        count += 1
    }
    
    func removeLast() -> Int? {
        guard count > 0 else {
            return nil
        }
        
        count -= 1
        
        let lastElement = backingArray[count]
        
        backingArray[count] = nil
        
        shrinkUnderlyingArrayIfNecessary()
        
        return lastElement
    }
    
    func remove(index: Int) -> Int? {
        guard count > 0 else {
            return nil
        }
        
        let removedElement = backingArray[index]
        
        count -= 1
        
        removeItemAndShiftElementsInUnderlyingArray(indexOfItemToRemove: index)
        
        backingArray[count] = nil
        
        shrinkUnderlyingArrayIfNecessary()
        
        return removedElement
    }

    // MARK: - Private Methods
    
    private func shrinkUnderlyingArrayIfNecessary() {
        if count > 0 && count == backingArray.count / 4 {
            var capacity = backingArray.count
            
            capacity /= 2
            
            resizeUnderlyingArray(newSize: capacity)
        }
    }
    
    private func growUnderlyingArrayIfNecessary() {
        if count == backingArray.count {
            var capacity = backingArray.count
            
            capacity *= 2
            
            resizeUnderlyingArray(newSize: capacity)
        }
    }
    
    private func resizeUnderlyingArray(newSize: Int) {
        var resizedArray: [Int?] = Array(repeating: nil, count: newSize)
        
        let replacementRange = 0..<count
        
        resizedArray.replaceSubrange(replacementRange, with: Array(replacementRange))
        
        backingArray = resizedArray
    }
    
    private func removeItemAndShiftElementsInUnderlyingArray(indexOfItemToRemove: Int) {
        var currentArrayIndex = indexOfItemToRemove
        
        while currentArrayIndex < count - 1 {
            backingArray[currentArrayIndex] = backingArray[currentArrayIndex + 1]
            
            currentArrayIndex += 1
        }
    }
}
