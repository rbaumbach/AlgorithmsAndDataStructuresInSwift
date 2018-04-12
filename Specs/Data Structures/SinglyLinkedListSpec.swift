import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class SinglyLinkedListSpec: QuickSpec {
    override func spec() {
        var subject: SinglyLinkedList!
        
        beforeEach {
            subject = SinglyLinkedList()
        }
        
        describe("#isEmpty()") {
            describe("when subject is empty") {
                it("returns true") {
                    expect(subject.isEmpty()).to(beTruthy())
                }
            }
            
            describe("when it is not empty") {
                beforeEach {
                    subject.addToFront(item: 77)
                }
                
                it("returns false") {
                    expect(subject.isEmpty()).to(beFalsy())
                }
            }
        }
        
        describe("#addToFront(item:)") {
            beforeEach {
                subject.addToFront(item: 99)
            }
            
            it("adds item to the subject") {
                expect(subject.peek()).to(equal(99))
            }
        }
    }
}
