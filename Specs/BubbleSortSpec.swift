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
            beforeEach {
                subject.inPlaceSort(array: &testArray!)
            }
            
            it("sorts the given array of integers") {
                expect(testArray).to(equal([0, 1, 2, 3, 4, 5]))
            }
        }
        
        // Rather than use a standard while loop we can reverse the range in which the for-in loop runs.  This is
        // more "Swifty" but requires the usage of the Swift reversed() function.
        
        describe("#swiftyInPlaceSort(array:)") {
            beforeEach {
                subject.inPlaceSort(array: &testArray!)
            }
            
            it("sorts the given array of integers") {
                expect(testArray).to(equal([0, 1, 2, 3, 4, 5]))
            }
        }
    }
}
