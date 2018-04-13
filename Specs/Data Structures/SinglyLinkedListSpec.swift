import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class SinglyLinkedListSpec: QuickSpec {
    override func spec() {
        var subject: SinglyLinkedList!
        
        beforeEach {
            subject = SinglyLinkedList()
        }
        
        describe("<CustomStringConvertible>") {
            describe("description") {
                var output: String!
                
                beforeEach {
                    subject.addToFront(item: 2)
                    subject.addToFront(item: 1)
                    subject.addToFront(item: 0)
                    
                    output = subject.description
                }
                it("displays the linked list all pretty and what not") {
                    let expectedOutput = "|0| -> |1| -> |2| -> nil"
                    expect(output).to(equal(expectedOutput))
                }
            }
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
        
        describe("#peek()") {
            var peekedItem: Int!
            
            describe("when the list is empty") {
                beforeEach {
                    peekedItem = subject.peek()
                }
                
                it("returns nil") {
                    expect(peekedItem).to(beNil())
                }
            }
            
            describe("when the list isn't empty") {
                beforeEach {
                    subject.addToFront(item: 22)
                    
                    peekedItem = subject.peek()
                }
                
                it("returns the item at the head of the subject") {
                    expect(peekedItem).to(equal(22))
                }
            }
        }
        
        describe("#addToFront(item:)") {
            beforeEach {
                subject.addToFront(item: 99)
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal(99))
                }
            }
            
            describe("when the list isn't empty") {
                beforeEach {
                    subject.addToFront(item: 999)
                }
                
                it("adds the item to the subject at the front of the linked list") {
                    expect(subject.peek()).to(equal(999))
                    
                    // the easiest way to test that it's adding a node in the front of a list is to remove it after
                    // and verify the old head is still present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal(99))
                }
            }
        }
        
        describe("#removeFromFront()") {
            var removedItem: Int!

            describe("when the list is empty") {
                beforeEach {
                    removedItem = subject.removeFromFront()
                }
                
                it("returns nil") {
                    expect(removedItem).to(beNil())
                }
            }
            
            describe("when the list is NOT empty") {
                beforeEach {
                    subject.addToFront(item: 11)
                    removedItem = subject.removeFromFront()
                }
                
                it("returns the item in the front of the linked list") {
                    expect(removedItem).to(equal(11))
                }
            }
        }
        
        describe("#addToBack(item:)") {
            beforeEach {
                subject.addToBack(item: 99)
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal(99))
                }
            }
            
            describe("when the list is NOT empty") {
                beforeEach {
                    subject.addToBack(item: 88)
                }
                
                it("adds the item to the subject at the back of the linked list") {
                    expect(subject.peek()).to(equal(99))
                    
                    // the easiest way to test that it's adding a node in the back of a list is to remove the item
                    // immediately before it and then verify it's present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal(88))
                }
            }
        }
        
        describe("#addToBackRecursively(item:)") {
            beforeEach {
                subject.addToBackRecursively(item: 99)
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal(99))
                }
            }
            
            describe("when the list is NOT empty") {
                beforeEach {
                    subject.addToBackRecursively(item: 88)
                }
                
                it("adds the item to the subject at the back of the linked list") {
                    expect(subject.peek()).to(equal(99))
                    
                    // the easiest way to test that it's adding a node in the back of a list is to remove the item
                    // immediately before it and then verify it's present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal(88))
                }
            }
        }
        
        describe("#removeFromBack()") {
            var removedItem: Int!

            describe("when the list is empty") {
                beforeEach {
                    removedItem = subject.removeFromBack()
                }

                it("returns nil") {
                    expect(removedItem).to(beNil())
                }
            }

            describe("when the list has one node") {
                beforeEach {
                    subject.addToBack(item: 12345)

                    removedItem = subject.removeFromBack()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal(12345))
                }
            }
            
            describe("when the list has more than one node") {
                beforeEach {
                    subject.addToBack(item: 12345)
                    subject.addToBack(item: 777)
                    
                    removedItem = subject.removeFromBack()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal(777))
                }
            }
        }
        
        describe("#removeFromBackRecursively()") {
            var removedItem: Int!
            
            describe("when the list is empty") {
                beforeEach {
                    removedItem = subject.removeFromBackRecursively()
                }
                
                it("returns nil") {
                    expect(removedItem).to(beNil())
                }
            }
            
            describe("when the list has one node") {
                beforeEach {
                    subject.addToBack(item: 12345)
                    
                    removedItem = subject.removeFromBackRecursively()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal(12345))
                }
            }
            
            describe("when the list has more than one node") {
                beforeEach {
                    subject.addToBack(item: 12345)
                    subject.addToBack(item: 777)
                    
                    removedItem = subject.removeFromBackRecursively()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal(777))
                }
            }
        }
        
        describe("#toArray()") {
            var generatedArray: [Int]!
            
            beforeEach {
                subject.addToFront(item: 0)
                subject.addToFront(item: 1)
                subject.addToFront(item: 2)
                subject.addToFront(item: 3)
                subject.addToFront(item: 4)
            }
            
            context("isAscending == false (default)") {
                beforeEach {
                    generatedArray = subject.toArray()
                }
                
                it("generates an array from head -> nil") {
                    expect(generatedArray).to(equal([4, 3, 2, 1, 0]))
                }
            }
            
            context("isAscending == true") {
                beforeEach {
                    generatedArray = subject.toArray(isAscending: true)
                }
                
                it("generates an array from nil -> head") {
                    expect(generatedArray).to(equal([0, 1, 2, 3, 4]))
                }
            }
        }
        
        describe("#forEach(_:)") {
            var items: [Int]!
            
            beforeEach {
                subject.addToFront(item: 0)
                subject.addToFront(item: 1)
                subject.addToFront(item: 2)
                
                items = []
                
                subject.forEach { item in
                    items.append(item)
                }
            }
            
            it("traverses the list and passes the node.item as a parameter to it's closure parameter") {
                expect(items).to(equal([2, 1, 0]))
            }
        }
    }
}
