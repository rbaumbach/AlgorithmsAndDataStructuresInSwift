import Foundation

extension Int {
    func integerReverse() -> Int {
        var originalInteger = self
        
        var reversedIntegerArray: [Int] = []
        
        while (originalInteger != 0) {
            reversedIntegerArray.append(originalInteger % 10)
            
            originalInteger = originalInteger / 10
        }
        
        var reversedInteger = 0
        
        for integer in reversedIntegerArray {
            reversedInteger = reversedInteger * 10 + integer
        }
        
        return reversedInteger
    }
}
