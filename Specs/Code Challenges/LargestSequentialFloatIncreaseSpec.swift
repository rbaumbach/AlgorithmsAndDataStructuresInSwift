import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Write a method that finds the largest amount of increating floats in an array and
//          returns a dictionary that has the start index of the first float, last index of
//          the final float, and difference between them
//          ex: [0.0, 0.1, 0.2, 0.1, 0.9, 1.1, 5.0] -> { "startIndex": 3,
//                                                      "endIndex": 6,
//                                                      "increaseValue: 4.9 }
//          Note: 0.0, 0.1, 0.2 is one increasing float segment, while
//                0.1, 0.9, 1.1, 5 is the second increasing float segment (which is the largest)

class LargestSequentialFloatIncreaseSpec: QuickSpec {
    override func spec() {
        var subject: LargestSequentialFloatIncrease!
        
        beforeEach {
            subject = LargestSequentialFloatIncrease()
        }
        
        describe("#find(input:)") {
            var inputArray: [Float]!
            var largestSequentialFloatIncrease: [String: Any]!
            
            beforeEach {
                inputArray = [0.0, 0.1, 0.2, 0.1, 0.9, 1.1, 5.0]
                largestSequentialFloatIncrease = subject.find(input: inputArray)
            }
            
            it("returns the largest sequential float increase") {
                let expectedDict: [String: Any] = ["startIndex": 3, "endIndex": 6, "increaseValue": Float(4.9)]
                
                expect(largestSequentialFloatIncrease["startIndex"] as? Int).to(equal(expectedDict["startIndex"] as? Int))
                expect((largestSequentialFloatIncrease["endIndex"] as? Int)).to(equal(expectedDict["endIndex"] as? Int))
                expect(largestSequentialFloatIncrease["increaseValue"] as? Float).to(equal(expectedDict["increaseValue"] as? Float))
            }
        }
    }
}
