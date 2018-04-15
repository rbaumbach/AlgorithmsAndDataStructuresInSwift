import Foundation

extension Int {
    func integerReverse() -> Int {
        var originalNumber = self
        
        var reversedIntegerArray: [Int] = []
        
        while (originalNumber != 0) {
            reversedIntegerArray.append(originalNumber % 10)
            
            originalNumber = originalNumber / 10
        }
        
        var reversedInteger = 0
        
        for integer in reversedIntegerArray {
            reversedInteger = reversedInteger * 10 + integer
        }
        
        return reversedInteger
    }
}
