import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class Array_QuickSortSpec: QuickSpec {
    override func spec() {
        var subject: Array<Int>!
        
        beforeEach {
            subject = [-1, 5, -99, -100, 10, 25, 3, 22, 800, 100]
        }
        
        describe("quickSort()") {
            beforeEach {
                subject.quickSort()
            }
            
            it("sorts the subject") {
                let expectedArray = [-100, -99, -1, 3, 5, 10, 22, 25, 100, 800]
                
                expect(subject).to(equal(expectedArray))
            }
        }
    }
}
