import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class BinaryTreeSearchNodeSpec: QuickSpec {
    override func spec() {
        var leftChildNode: BinarySearchTreeNode<String, String>!
        var rightChildNode: BinarySearchTreeNode<String, String>!
        
        var subject: BinarySearchTreeNode<String, String>!
        
        beforeEach {
            leftChildNode = BinarySearchTreeNode(key: "zero", value: "cero")
            rightChildNode = BinarySearchTreeNode(key: "twenty", value: "veinte")
            
            subject = BinarySearchTreeNode(key: "one hundred", value: "cien")
            subject.leftChildNode = leftChildNode
            subject.rightChildNode = rightChildNode
        }
        
        it("has a key") {
            expect(subject.key).to(equal("one hundred"))
        }
        
        it("has a value") {
            expect(subject.value).to(equal("cien"))
        }
        
        it("has a left child node") {
            expect(subject.leftChildNode).to(equal(leftChildNode))
        }
        
        it("has a right child node") {
            expect(subject.rightChildNode).to(equal(rightChildNode))
        }
        
        describe("<Equatable>") {
            var anotherNode: BinarySearchTreeNode<String, String>!
            
            describe("when a binary search tree node is equal to another") {
                beforeEach {
                    anotherNode = BinarySearchTreeNode(key: "one hundred", value: "cien")
                    anotherNode.leftChildNode = leftChildNode
                    anotherNode.rightChildNode = rightChildNode
                }
                
                it("is equal") {
                    expect(subject == anotherNode).to(beTruthy())
                }
            }
            
            describe("when item and nextNode for the left do NOT equal the rhs") {
                beforeEach {
                    anotherNode = BinarySearchTreeNode(key: "zero", value: "cero")
                }

                it("is NOT equal") {
                    expect(subject == anotherNode).to(beFalsy())
                }
            }
        }
    }
}
