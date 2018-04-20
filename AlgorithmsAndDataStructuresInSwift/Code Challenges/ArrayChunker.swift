import Foundation

class ArrayChunker {
    // MARK: - Public Methods
    
    func chunk(array: [Int], chunkSize: Int) -> [[Int]] {
        var chunkedArray: [[Int]] = []
        
        generateArrayChunks(inputArray: array, chunkSize: chunkSize) { chunkArray in
            chunkedArray.append(chunkArray)
        }
        
        return chunkedArray
    }
    
    // MARK: - Private Methods
    
    private func generateArrayChunks(inputArray: [Int],
                                     chunkSize: Int,
                                     onChunkCreation: ([Int]) -> Void) {
        var chunkSizeCounter = 0
        
        var currentChunk: [Int] = []
        
        inputArray.forEach { number in
            currentChunk.append(number)
            
            chunkSizeCounter += 1
            
            if chunkSizeCounter > chunkSize - 1 {
                onChunkCreation(currentChunk)
                
                currentChunk = []
                
                chunkSizeCounter = 0
            }
        }
        
        if !currentChunk.isEmpty {
            onChunkCreation(currentChunk)
        }
    }
}
