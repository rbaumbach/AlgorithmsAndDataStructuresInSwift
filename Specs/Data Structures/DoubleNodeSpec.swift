import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class DoubleNodeSpec: QuickSpec {
    override func spec() {
        var subject: DoubleNode!
        var previousNode: DoubleNode!
        var nextNode: DoubleNode!
        
        beforeEach {
            previousNode = DoubleNode()
            nextNode = DoubleNode()
            
            subject = DoubleNode()
            subject.item = 42
            subject.previousNode = previousNode
            subject.nextNode = nextNode
        }
        
        it("has a value") {
            expect(subject.item).to(equal(42))
        }
        
        it("has a reference to a 'previous' double node") {
            expect(subject.previousNode).to(equal(previousNode))
        }
        
        it("has a reference to a 'next' double node") {
            expect(subject.nextNode).to(equal(nextNode))
        }
        
        it("has a init that where you can pass in an item") {
            let node = DoubleNode(item: 42)
            
            expect(node.item).to(equal(42))
        }
        
        describe("<Equatable>") {
            var rightHandSideNode: DoubleNode!
            
            describe("when item and nextNode for the lhs equal the rhs") {
                beforeEach {
                    rightHandSideNode = DoubleNode(item: 42)
                    rightHandSideNode.previousNode = previousNode
                    rightHandSideNode.nextNode = nextNode
                }
                
                it("is equal") {
                    expect(subject == rightHandSideNode).to(beTruthy())
                }
            }
            
            describe("when item and nextNode for the left do NOT equal the rhs") {
                beforeEach {
                    rightHandSideNode = DoubleNode(item: 10)
                    rightHandSideNode.previousNode = DoubleNode()
                    rightHandSideNode.nextNode = DoubleNode()
                }
                
                it("is NOT equal") {
                    expect(subject == rightHandSideNode).to(beFalsy())
                }
            }
        }
    }
}
