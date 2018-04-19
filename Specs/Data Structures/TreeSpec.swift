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
        
        describe("traversal methods") {
            var aPopulatedRoot: TreeNode<String>!
            var traversalResult: [String]!
            
            beforeEach {
                aPopulatedRoot = TreeNode<String>(item: "Uno")
                let children = [TreeNode<String>(item: "Dos"), TreeNode<String>(item: "Tres"), TreeNode<String>(item: "Quatro")]
                let grandChildrenA = [TreeNode<String>(item: "Cinco"), TreeNode<String>(item: "Seis")]
                let grandChildrenB = [TreeNode<String>(item: "Siete")]
                let grandChildrenC = [TreeNode<String>(item: "Ocho"), TreeNode<String>(item: "Nueve")]
                
                children[0].children = grandChildrenA
                children[1].children = grandChildrenB
                children[2].children = grandChildrenC
                
                aPopulatedRoot.children = children
            }
            
            describe("#traverseBreadthFirst()") {
                describe("when tree is empty") {
                    beforeEach {
                        traversalResult = subject.traverseBreadthFirst()
                    }
                    
                    it("returns an empty array") {
                        expect(traversalResult).to(equal([]))
                    }
                }
                
                describe("when the tree is NOT empty") {
                    beforeEach {
                        subject.root = aPopulatedRoot

                        traversalResult = subject.traverseBreadthFirst()
                    }
                    
                    it("returns an array of TreeNodes that have been assembed breadth first") {
                        let expectedArray = ["Uno", "Dos", "Tres", "Quatro", "Cinco", "Seis", "Siete", "Ocho", "Nueve"]
                        
                        expect(traversalResult).to(equal(expectedArray))
                    }
                }
            }
            
            describe("#traverseDepthFirst()") {
                describe("when tree is empty") {
                    beforeEach {
                        traversalResult = subject.traverseDepthFirst()
                    }
                    
                    it("returns an empty array") {
                        expect(traversalResult).to(equal([]))
                    }
                }
                
                describe("when the tree is NOT empty") {
                    beforeEach {
                        subject.root = aPopulatedRoot
                        
                        traversalResult = subject.traverseDepthFirst()
                    }
                    
                    it("returns an array of TreeNodes that have been assembed breadth first") {
                        let expectedArray = ["Uno", "Dos", "Cinco", "Seis", "Tres", "Siete", "Quatro", "Ocho", "Nueve"]
                        
                        expect(traversalResult).to(equal(expectedArray))
                    }
                }
            }
        }
    }
}
