import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class TreeNodeSpec: QuickSpec {
    override func spec() {
        var subject: TreeNode<Int>!
        var children: [TreeNode<Int>]!
        
        beforeEach {
            children = [TreeNode<Int>(item: 0), TreeNode<Int>(item: 1), TreeNode<Int>(item: 2)]
            
            subject = TreeNode<Int>(item: 42)
            subject.children = children
        }
        
        it("has a value") {
            expect(subject.item).to(equal(42))
        }
        
        it("has children") {
            expect(subject.children).to(equal([TreeNode<Int>(item: 0), TreeNode<Int>(item: 1), TreeNode<Int>(item: 2)]))
        }
        
        describe("#add(item:)") {
            beforeEach {
                subject.add(item: -1)
            }
            
            it("adds a new node with the new item") {
                expect(subject.children).to(equal([TreeNode<Int>(item: 0), TreeNode<Int>(item: 1), TreeNode<Int>(item: 2), TreeNode<Int>(item: -1)]))
            }
        }
        
        describe("#remove(item:)") {
            beforeEach {
                subject.add(item: 0)
                subject.add(item: 0)
                
                subject.remove(item: 0)
            }
            
            it("removes all the nodes that match the removed item") {
                expect(subject.children).to(equal([TreeNode<Int>(item: 1), TreeNode<Int>(item: 2)]))
            }
        }
    }
}
