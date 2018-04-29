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
        if count == backingArray.count {
            var capacity = backingArray.count
            
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
        
        if count > 0 && count == backingArray.count / 4 {
            var capacity = backingArray.count
            
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
