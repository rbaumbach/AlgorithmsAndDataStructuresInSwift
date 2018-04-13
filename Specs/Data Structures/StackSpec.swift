import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class StackSpec: QuickSpec {
    override func spec() {
        var subject: Stack!
        
        beforeEach {
            subject = Stack()
        }
        
        describe("#push(item:)") {
            beforeEach {
                subject.push(item: 99)
            }
            
            it("pushes the item on to the subject") {
                expect(subject.peek()).to(equal(99))
            }
        }
        
        describe("#pop()") {
            var poppedItem: Int!
            
            describe("when the stack is empty") {
                it("returns nil") {
                    expect(subject.pop()).to(beNil())
                }
            }
            
            describe("when the stack is NOT empty") {
                beforeEach {
                    subject.push(item: 5)
                    
                    poppedItem = subject.pop()
                }
                
                it("pops the item off of the subject") {
                    expect(poppedItem).to(equal(5))
                    
                    // easy way to verify that the item was removed from the stack
                    
                    expect(subject.peek()).to(beNil())
                }
            }
        }
        
        describe("#peek()") {
            describe("when the stack is empty") {
                it("returns nil") {
                    expect(subject.peek()).to(beNil())
                }
            }
            
            describe("when the stack is NOT empty") {
                beforeEach {
                    subject.push(item: 77)
                }
                
                it("returns the item on the top of the subject without removing the item from the subject") {
                    expect(subject.peek()).to(equal(77))
                    
                    // doing the peek twice to show that it is still on the stack
                    
                    expect(subject.peek()).to(equal(77))
                }
            }
        }
        
        describe("#isEmpty()") {
            describe("when stack is empty") {
                it("returns true") {
                    expect(subject.isEmpty()).to(beTruthy())
                }
            }
            
            describe("when stack is NOT empty") {
                beforeEach {
                    subject.push(item: 33)
                }
                
                it("returns false") {
                    expect(subject.isEmpty()).to(beFalsy())
                }
            }
        }
        
        describe("#clear()") {
            beforeEach {
                subject.push(item: 0)
                
                subject.clear()
            }
            
            it("clears the stack") {
                expect(subject.isEmpty()).to(beTruthy())
            }
        }
    }
}
