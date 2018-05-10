import UIKit

extension Array where Element: Comparable  {
    // MARK: - Public Method
    
    mutating func mergeSort() {
        mergeSort(start: 0, end: self.count)
    }
    
    // MARK: - Private Methods
    
    private mutating func mergeSort(start: Int, end: Int) {
        if (end - start < 2) {
            return
        }

        let mid = (start + end) / 2
        
        mergeSort(start: start, end: mid)
        mergeSort(start: mid, end: end)

        merge(start: start, mid: mid, end: end)
    }
    
    private mutating func merge(start: Int, mid: Int, end: Int) {
        if (end - start) < 2 {
            return
        }
        
        var leftArray = Array(self[start..<mid])
        var rightArray = Array(self[mid..<end])
        
        var tempArray: [Int] = []
        
        while leftArray.count != 0 && rightArray.count != 0 {
            if leftArray[0] < rightArray[0] {
                tempArray.append(leftArray.removeFirst() as! Int)
            } else {
                tempArray.append(rightArray.removeFirst() as! Int)
            }
        }
        
        tempArray += (leftArray as! [Int])
        tempArray += (rightArray as! [Int])
        
        var originalArrayStartIndex = start
        
        tempArray.forEach { item in
            self[originalArrayStartIndex] = item as! Element
            
            originalArrayStartIndex += 1
        }
    }
}

