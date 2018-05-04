import Foundation

extension Int {
    // MARK: - Public Methods
    
    func isPrime() -> Bool {
        if self == 1 || self == 2 {
            return true
        }
        
        for number in 2..<self {
            if self % number == 0 {
                return false
            }
        }
        
        return true
    }
    
    func betterIsPrime() -> Bool {
        if self == 0 || self > 2 && self % 2 == 0 {
            return false
        }
        
        var oddNumber = 3
        
        while oddNumber * oddNumber <= self {
            if self % oddNumber == 0 {
                return false
            }
            
            oddNumber += 2
        }
        
        return true
    }
}
