import Foundation

class MatrixSortedSearch {
    // MARK: - Public Methods

    func search(matrix: [[Int]], number: Int) -> (Int, Int) {
        return search(matrix: matrix,
                      number: number,
                      start: 0,
                      end: matrix.count)
    }
    
    func iterativeSearch(matrix: [[Int]], number: Int) -> (Int, Int) {
        return (-2, -2)
    }
    
    // MARK: - Private Methods
    
    func search(matrix: [[Int]], number: Int, start: Int, end: Int) -> (Int, Int) {
        if start >= end {
            return (-1, -1)
        }
        
        let mid = (start + end) / 2
        
        if number >= matrix[mid][0] && number <= matrix[mid][matrix[mid].count - 1] {
            let nLocation = mid
            let mLocation = matrix[mid].binarySearch(item: number)
            
            if mLocation == -1 {
                return (-1, -1)
            }
            
            return (nLocation, mLocation)
        } else if number < matrix[mid][0] {
            return search(matrix: matrix,
                          number: number,
                          start: start,
                          end: mid)
        } else {
            return search(matrix: matrix,
                          number: number,
                          start: mid + 1,
                          end: end)
        }
    }
}