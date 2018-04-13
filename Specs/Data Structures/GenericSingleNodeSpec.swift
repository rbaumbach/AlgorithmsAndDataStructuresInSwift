import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class GenericSingleNodeSpec: QuickSpec {
    override func spec() {
        var subject: GenericSingleNode<String>!
        var nextNode: GenericSingleNode<String>!
        
        beforeEach {
            nextNode = GenericSingleNode<String>(item: "Burrito")
            
            subject = GenericSingleNode<String>(item: "Taco")
            subject.nextNode = nextNode
        }
        
        it("has a value") {
            expect(subject.item).to(equal("Taco"))
        }
        
        it("has a reference to a 'next' single node") {
            expect(subject.nextNode).to(equal(nextNode))
        }
        
        it("has a init that where you can pass in an item") {
            let node = GenericSingleNode(item: 42)
            
            expect(node.item).to(equal(42))
        }
        
        describe("<Equatable>") {
            var rightHandSideNode: GenericSingleNode<String>!
            
            describe("when item and nextNode for the lhs equal the rhs") {
                beforeEach {
                    rightHandSideNode = GenericSingleNode<String>(item: "Taco")
                    rightHandSideNode.nextNode = nextNode
                }
                
                it("is equal") {
                    expect(subject == rightHandSideNode).to(beTruthy())
                }
            }
            
            describe("when item and nextNode for the left do NOT equal the rhs") {
                beforeEach {
                    rightHandSideNode = GenericSingleNode<String>(item: "more-junk")
                    rightHandSideNode.nextNode = GenericSingleNode<String>(item: "blah")
                }
                
                it("is NOT equal") {
                    expect(subject == rightHandSideNode).to(beFalsy())
                }
            }
        }
    }
}
