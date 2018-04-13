import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

class GenericSinglyLinkedListSpec: QuickSpec {
    override func spec() {
        var subject: GenericSinglyLinkedList<String>!
        
        beforeEach {
            subject = GenericSinglyLinkedList<String>()
        }
        
        describe("<CustomStringConvertible>") {
            describe("description") {
                var output: String!
                
                beforeEach {
                    subject.addToFront(item: "Two")
                    subject.addToFront(item: "One")
                    subject.addToFront(item: "Zero")
                    
                    output = subject.description
                }
                it("displays the linked list all pretty and what not") {
                    let expectedOutput = "|Zero| -> |One| -> |Two| -> nil"
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
                    subject.addToFront(item: "who-cares")
                }
                
                it("returns false") {
                    expect(subject.isEmpty()).to(beFalsy())
                }
            }
        }
        
        describe("#peek()") {
            var peekedItem: String!
            
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
                    subject.addToFront(item: "peeky-weeky")
                    
                    peekedItem = subject.peek()
                }
                
                it("returns the item at the head of the subject") {
                    expect(peekedItem).to(equal("peeky-weeky"))
                }
            }
        }
        
        describe("#addToFront(item:)") {
            beforeEach {
                subject.addToFront(item: "ninty-nine")
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal("ninty-nine"))
                }
            }
            
            describe("when the list isn't empty") {
                beforeEach {
                    subject.addToFront(item: "Enchilada")
                }
                
                it("adds the item to the subject at the front of the linked list") {
                    expect(subject.peek()).to(equal("Enchilada"))
                    
                    // the easiest way to test that it's adding a node in the front of a list is to remove it after
                    // and verify the old head is still present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal("ninty-nine"))
                }
            }
        }
        
        describe("#removeFromFront()") {
            var removedItem: String!
            
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
                    subject.addToFront(item: "Mad Max")
                    removedItem = subject.removeFromFront()
                }
                
                it("returns the item in the front of the linked list") {
                    expect(removedItem).to(equal("Mad Max"))
                }
            }
        }
        
        describe("#addToBack(item:)") {
            beforeEach {
                subject.addToBack(item: "cake")
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal("cake"))
                }
            }
            
            describe("when the list is NOT empty") {
                beforeEach {
                    subject.addToBack(item: "pie")
                }
                
                it("adds the item to the subject at the back of the linked list") {
                    expect(subject.peek()).to(equal("cake"))
                    
                    // the easiest way to test that it's adding a node in the back of a list is to remove the item
                    // immediately before it and then verify it's present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal("pie"))
                }
            }
        }
        
        describe("#addToBackRecursively(item:)") {
            beforeEach {
                subject.addToBackRecursively(item: "truck")
            }
            
            describe("when the list is empty") {
                it("adds item to the subject") {
                    expect(subject.peek()).to(equal("truck"))
                }
            }
            
            describe("when the list is NOT empty") {
                beforeEach {
                    subject.addToBackRecursively(item: "car")
                }
                
                it("adds the item to the subject at the back of the linked list") {
                    expect(subject.peek()).to(equal("truck"))
                    
                    // the easiest way to test that it's adding a node in the back of a list is to remove the item
                    // immediately before it and then verify it's present
                    
                    _ = subject.removeFromFront()
                    
                    expect(subject.peek()).to(equal("car"))
                }
            }
        }
        
        describe("#removeFromBack()") {
            var removedItem: String!
            
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
                    subject.addToBack(item: "12345")
                    
                    removedItem = subject.removeFromBack()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal("12345"))
                }
            }
            
            describe("when the list has more than one node") {
                beforeEach {
                    subject.addToBack(item: "12345")
                    subject.addToBack(item: "777")
                    
                    removedItem = subject.removeFromBack()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal("777"))
                }
            }
        }
        
        describe("#removeFromBackRecursively()") {
            var removedItem: String!
            
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
                    subject.addToBack(item: "shirts")
                    
                    removedItem = subject.removeFromBackRecursively()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal("shirts"))
                }
            }
            
            describe("when the list has more than one node") {
                beforeEach {
                    subject.addToBack(item: "shirts")
                    subject.addToBack(item: "skins")
                    
                    removedItem = subject.removeFromBackRecursively()
                }
                it("returns the item at the back of the linked list") {
                    expect(removedItem).to(equal("skins"))
                }
            }
        }
        
        describe("#toArray()") {
            var generatedArray: [String]!
            
            beforeEach {
                subject.addToFront(item: "0")
                subject.addToFront(item: "1")
                subject.addToFront(item: "2")
                subject.addToFront(item: "3")
                subject.addToFront(item: "4")
            }
            
            context("isAscending == false (default)") {
                beforeEach {
                    generatedArray = subject.toArray()
                }
                
                it("generates an array from head -> nil") {
                    expect(generatedArray).to(equal(["4", "3", "2", "1", "0"]))
                }
            }
            
            context("isAscending == true") {
                beforeEach {
                    generatedArray = subject.toArray(isAscending: true)
                }
                
                it("generates an array from nil -> head") {
                    expect(generatedArray).to(equal(["0", "1", "2", "3", "4"]))
                }
            }
        }
        
        describe("#forEach(_:)") {
            var items: [String]!
            
            beforeEach {
                subject.addToFront(item: "0")
                subject.addToFront(item: "1")
                subject.addToFront(item: "2")
                
                items = []
                
                subject.forEach { item in
                    items.append(item)
                }
            }
            
            it("traverses the list and passes the node.item as a parameter to it's closure parameter") {
                expect(items).to(equal(["2", "1", "0"]))
            }
        }
    }
}
