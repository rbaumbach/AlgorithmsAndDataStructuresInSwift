import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Write a method that finds the first ascension of letters and returns the index of the start letter of the
//          ascension, and the end index of the ascension as a 2 element array
//          ex: ["b", "a", "b", "z", "r", "f", "c"] -> (1, 3)
//          The first "a" is the start of the first ascension, and ends at "z" because the letter after this
//          begins a descension.
//          Note: This would be easier with a tuple, but nimble has matcher issues with tuple.

class AscendingValueDetectorSpec: QuickSpec {
    override func spec() {
        var subject: AscendingValueDetector!
        
        beforeEach {
            subject = AscendingValueDetector()
        }
        
        describe("#findFirst(input:)") {
            var inputArray: [String]!
            var firstAsendingValueIndicies: [Int]!
            
            describe("when the input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array does NOT have any ascending values") {
                beforeEach {
                    inputArray = ["b", "c"]
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array has ascending values") {
                beforeEach {
                    inputArray = ["b", "a", "b", "z", "r", "f", "c", "a", "b", "c"]
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns the start and end index of the first ascending letters") {
                    expect(firstAsendingValueIndicies).to(equal([1, 3]))
                }
            }
        }
        
        // Extra wrinkle: Handle duplicate values at the startIndex and endIndex of the ascending letters.  The start index should
        // be the last letter if there are duplicate letters, and the end index should be the first letter of the duplicate
        // letters.  Duplicate letters within the letter ascension should be ignored
        // ex: ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a"] -> [3, 10]
        
        describe("#findFirstTake2(input:)") {
            var inputArray: [String]!
            var firstAsendingValueIndicies: [Int]!

            describe("when the input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array does NOT have any ascending values") {
                beforeEach {
                    inputArray = ["b", "c"]
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array has ascending values") {
                beforeEach {
                    inputArray = ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a"]
                    firstAsendingValueIndicies = subject.findFirstTake2(input: inputArray)
                }
                
                it("returns the start and end index of the first ascending letters") {
                    expect(firstAsendingValueIndicies).to(equal([3, 10]))
                }
            }
        }
    }
}
