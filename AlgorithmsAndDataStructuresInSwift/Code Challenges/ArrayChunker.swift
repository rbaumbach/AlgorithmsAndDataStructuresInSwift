import Foundation

class ArrayChunker {
    // MARK: - Public Methods
    
    func chunk(array: [Int], chunkSize: Int) -> [[Int]] {
        var chunkSizeCounter = 0
        
        var currentChunk: [Int] = []
        
        var chunkedArray: [[Int]] = []
        
        for (index, number) in array.enumerated() {
            currentChunk.append(number)
            
            chunkSizeCounter += 1
            
            if chunkSizeCounter > chunkSize - 1 {
                chunkedArray.append(currentChunk)
                
                currentChunk = []
                
                chunkSizeCounter = 0
            }
            
            if index == array.count - 1 && !currentChunk.isEmpty {
                chunkedArray.append(currentChunk)
            }
        }
        
        return chunkedArray
    }
}
