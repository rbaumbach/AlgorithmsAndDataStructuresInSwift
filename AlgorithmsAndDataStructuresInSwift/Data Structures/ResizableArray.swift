import Foundation

class ResizableArray {
    // MARK: - Private Properties
    
    private(set) var backingArray: [Int?]
    
    // we will probably not need this, I think the capacity is only useful when creating the initial array
    private(set) var capacity = 1
    
    var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }

    // MARK: - Init Methods
    
    init() {
        backingArray = Array(repeating: nil, count: capacity)
    }
    
    init(capacity: Int) {
        self.capacity = capacity
        
        backingArray = Array(repeating: nil, count: self.capacity)
    }
    
    // MARK: - Public Methods
    
    func getItem(index: Int) -> Int? {
        guard index < count else {
            return nil
        }
        
        return backingArray[index]
    }
    
    func append(item: Int) {
        if count == capacity {
            capacity *= 2
            
            resizeUnderlyingArray(newSize: capacity)
        }
        
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
        
        if count > 0 && count == capacity / 4 {
            capacity /= 2
            
            resizeUnderlyingArray(newSize: capacity)
        }
        
        return lastElement
    }

    // MARK: - Private Methods
    
    private func resizeUnderlyingArray(newSize: Int) {
        var resizedArray: [Int?] = Array(repeating: nil, count: newSize)
        
        let replacementRange = 0..<count
        
        resizedArray.replaceSubrange(replacementRange, with: Array(replacementRange))
        
        backingArray = resizedArray
    }
}
