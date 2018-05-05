import Foundation

class Fibonacci {
    // MARK: - Public Methods
    
    func generate(upto: Int) -> [Int] {
        if upto < 0 {
            return []
        }
        
        if upto == 0 {
            return [0]
        } else if upto == 1 {
            return [0, 1]
        }
        
        var outputArray: [Int] = [0, 1]
        
        for _ in 2...upto {
            outputArray.append(outputArray[outputArray.count - 2] + outputArray[outputArray.count - 1])
        }
        
        return outputArray
    }
    
    func recursiveGenerate(upto: Int) -> [Int] {
        return []
    }
}
