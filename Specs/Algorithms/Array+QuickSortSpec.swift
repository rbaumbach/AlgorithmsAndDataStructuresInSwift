import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class Array_QuickSortSpec: QuickSpec {
    override func spec() {
        var subject: [Int]!
        
        describe("quickSort()") {
            it("sorts the subject") {
                subject = [-1, 5, -99, -100, 10, 25, 3, 22, 800, 100]
                subject.quickSort()

                expect(subject).to(equal([-100, -99, -1, 3, 5, 10, 22, 25, 100, 800]))
                
                subject = []
                subject.quickSort()
                
                expect(subject).to(equal([]))
                
                subject = [1]
                subject.quickSort()
                
                expect(subject).to(equal([1]))
                
                subject = [0, 1001]
                subject.quickSort()
                
                expect(subject).to(equal([0, 1001]))
            }
        }
    }
}
