import Foundation

extension Array where Element: Comparable {
    func binarySearch(item: Element) -> Bool {
        var start = 0
        var end = self.count

        while start < end {
            let mid = (start + end) / 2

            if item == self[mid] {
                return true
            } else if item < self[mid] {
                end = mid
            } else {
                start = mid + 1
            }
        }

        return false
    }
    
    func recursiveBinarySearch(item: Element) -> Bool {
        return recursiveBinarySearch(item: item, start: 0, end: self.count)
    }
    
    func recursiveBinarySearch(item: Element, start: Int, end: Int) -> Bool {
        if start >= end {
            return false
        }
        
        let mid = (start + end) / 2
        
        if item == self[mid] {
            return true
        } else if item < self[mid] {
            return recursiveBinarySearch(item: item, start: start, end: mid)
        } else {
            return recursiveBinarySearch(item: item, start: mid + 1, end: end)
        }
    }
}
