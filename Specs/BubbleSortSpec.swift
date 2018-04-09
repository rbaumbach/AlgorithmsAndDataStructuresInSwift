import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class BubbleSortSpec: QuickSpec {
    override func spec() {
        var subject: BubbleSort!
        var testArray: [Int]!

        beforeEach {
            subject = BubbleSort()
            
            testArray = [5, 4, 3, 2, 1, 0]
        }
        
        // Since Swift no longer has ++ or -- operators, it isn't possible to write the outer loop as a classic
        // for loop.  Instead we use a while loop while a variable manually before and during the while loop.
        
        
        describe("#inPlaceSort(array:)") {
            it("sorts the given array of integers") {
                subject.inPlaceSort(array: &testArray!)
                expect(testArray).to(equal([0, 1, 2, 3, 4, 5]))
            }
            
            describe("single element array") {
                it("doesn't blow up") {
                    var singleElementArray = [42]
                    expect(subject.inPlaceSort(array: &singleElementArray)).toNot(raiseException())
                    expect(singleElementArray).to(equal([42]))
                }
            }
            
            describe("empty array") {
                it("doesn't blow up") {
                    var emptyArray: [Int] = []
                    expect(subject.inPlaceSort(array: &emptyArray)).toNot(raiseException())
                    expect(emptyArray).to(equal([]))
                }
            }
        }
        
        // Rather than use a standard while loop we can reverse the range in which the for-in loop runs.  This is
        // more "Swifty" but requires the usage of the Swift reversed() function.
        
        describe("#swiftyInPlaceSort(array:)") {
            it("sorts the given array of integers") {
                subject.swiftyInPlaceSort(array: &testArray!)
                expect(testArray).to(equal([0, 1, 2, 3, 4, 5]))
            }
            
            describe("single element array") {
                it("doesn't blow up") {
                    var singleElementArray = [42]
                    expect(subject.swiftyInPlaceSort(array: &singleElementArray)).toNot(raiseException())
                    expect(singleElementArray).to(equal([42]))
                }
            }

            describe("empty array") {
                it("doesn't blow up") {
                    var emptyArray: [Int] = []
                    expect(subject.swiftyInPlaceSort(array: &emptyArray)).toNot(raiseException())
                    expect(emptyArray).to(equal([]))
                }
            }
        }
    }
}
