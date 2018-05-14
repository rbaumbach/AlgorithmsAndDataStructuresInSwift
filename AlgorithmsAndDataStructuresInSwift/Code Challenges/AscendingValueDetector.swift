import UIKit

class AscendingValueDetector: NSObject {
    // MARK: - Public Methods
    
    func findFirst(input: [String]) -> [Int] {
        var startIndex = -1
        
        var i = 0
        
        while i < input.count - 1 {
            if startIndex == -1 && input[i] < input[i + 1] {
                startIndex = i
            } else if startIndex != -1 && input[i] > input[i + 1] {
                return [startIndex, i]
            }
            
            i += 1
        }
        
        return []
    }
    
    func findFirstTake2(input: [String]) -> [Int] {
        var startIndex = -1
        var endIndex = -1
        
        var i = 0
        
        while i < input.count - 1 {
            if startIndex == -1 && input[i] < input[i + 1] {
                startIndex = i
                endIndex = i + 1
            } else if input[i] < input[i + 1] {
                endIndex = i + 1
            } else if startIndex != -1 && input[i] > input[i + 1] {
                return [startIndex, endIndex]
            }
            
            i += 1
        }
        
        return []
    }
}
