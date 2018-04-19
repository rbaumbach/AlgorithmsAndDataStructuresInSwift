import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class TreeSpec: QuickSpec {
    override func spec() {
        var subject: Tree<String>!
        
        beforeEach {
            subject = Tree<String>()
        }
        
        it("can be initalized with a root") {
            subject.root = TreeNode<String>(item: "uno")
            
            expect(subject.root).to(equal(TreeNode<String>(item: "uno")))
        }
        
        describe("#isEmpty()") {
            describe("when tree is empty") {
                it("returns true") {
                    expect(subject.isEmpty()).to(beTruthy())
                }
            }
            
            describe("when tree is NOT empty") {
                beforeEach {
                    subject.root = TreeNode<String>(item: "Billy Goat")
                }
                
                it("it returns false") {
                    expect(subject.isEmpty()).to(beFalsy())
                }
            }
        }
    }
}
