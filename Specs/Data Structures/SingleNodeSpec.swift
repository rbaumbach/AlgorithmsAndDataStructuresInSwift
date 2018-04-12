import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class SingleNodeSpec: QuickSpec {
    override func spec() {
        var subject: SingleNode!
        var nextNode: SingleNode!
        
        beforeEach {
            nextNode = SingleNode()
            
            subject = SingleNode()
            subject.item = 42
            subject.nextNode = nextNode
        }
        
        it("has a value") {
            expect(subject.item).to(equal(42))
        }
        
        it("has a reference to a 'next' single node") {
            expect(subject.nextNode).to(equal(nextNode))
        }
        
        it("has a init that where you can pass in an item") {
            let node = SingleNode(item: 42)
            
            expect(node.item).to(equal(42))
        }
        
        describe("<Equatable>") {
            var rightHandSideNode: SingleNode!
            
            describe("when item and nextNode for the lhs equal the rhs") {
                beforeEach {
                    rightHandSideNode = SingleNode(item: 42)
                    rightHandSideNode.nextNode = nextNode
                }
                
                it("is equal") {
                    expect(subject == rightHandSideNode).to(beTruthy())
                }
            }
            
            describe("when item and nextNode for the left do NOT equal the rhs") {
                beforeEach {
                    rightHandSideNode = SingleNode(item: 10)
                    rightHandSideNode.nextNode = SingleNode()
                }
                
                it("is NOT equal") {
                    expect(subject == rightHandSideNode).to(beFalsy())
                }
            }
        }
    }
}
