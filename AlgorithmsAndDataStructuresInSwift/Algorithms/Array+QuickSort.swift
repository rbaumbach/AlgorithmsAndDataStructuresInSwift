import Foundation

extension Array where Element: Comparable {
    // MARK: Public Methods
    
    mutating func quickSort() {
        quickSort(start: 0, end: self.count)
    }
    
    mutating func quickSort(start: Int, end: Int) {
        if end <= start {
            return
        }
        
        let partitionIndex = partition(start: start, end: end)
        
        quickSort(start: start, end: partitionIndex)
        quickSort(start: partitionIndex + 1, end: end)
    }
    
    mutating func partition(start: Int, end: Int) -> Int {
        var leftIndex = start
        var rightIndex = end
        
        let partitionValue = self[start] as! Int
        
        while leftIndex < rightIndex {
            leftIndex += 1
            
            while leftIndex < end && (self[leftIndex] as! Int) < partitionValue {
                leftIndex += 1
            }
            
            rightIndex -= 1
            
            while rightIndex > start && (self[rightIndex] as! Int) > partitionValue {
                rightIndex -= 1
            }
            
            if leftIndex < rightIndex {
                swap(index1: leftIndex, index2: rightIndex)
            }
        }
        
        self[start] = self[rightIndex]
        self[rightIndex] = partitionValue as! Element
        
        return rightIndex
    }
    
    // MARK: - Private Methods
    
    private mutating func swap(index1: Int, index2: Int) {
        let temp = self[index1]
        self[index1] = self[index2]
        self[index2] = temp
    }
}
