import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Note: While Swift arrays are already "resizable" by default, this is how you'd create a resizeable array.

class ResizableArraySpec: QuickSpec {
    override func spec() {
        var subject: ResizableArray!
        
        beforeEach {
            subject = ResizableArray()
        }
        
        it("has an initial size of 1 with nil value") {
            expect(subject.count).to(equal(0))
            expect(subject.getItem(index: 0)).to(beNil())
        }
        
        describe("#isEmpty") {
            describe("when no items have been added") {
                it("returns true") {
                    expect(subject.isEmpty).to(beTruthy())
                }
            }
            
            describe("when items have been added") {
                beforeEach {
                    subject.append(item: 0)
                }
                
                it("returns false") {
                    expect(subject.isEmpty).to(beFalsy())
                }
            }
        }
        
        describe("#getItem(index:)") {
            describe("when array is empty") {
                it("returns nil") {
                    expect(subject.getItem(index: 0)).to(beNil())
                }
            }
            
            describe("when user attempts to retrieve an item with an index out of bounds (index > count - 1)") {
                it("returns nil") {
                    expect(subject.getItem(index: 1)).to(beNil())
                }
            }
            
            it("returns the item at the given index") {
                subject.append(item: 0)
                
                expect(subject.getItem(index: 0)).to(equal(0))
            }
        }
        
        describe("#append(item:)") {
            describe("when backing array doesn't require a resize") {
                beforeEach {
                    subject.append(item: 0)
                }
                
                it("adds the item to the array") {
                    expect(subject.getItem(index: 0)).to(equal(0))
                }
            }
            
            describe("when backing array requires a resize") {
                beforeEach {
                    subject.append(item: 0)
                    subject.append(item: 1)
                    subject.append(item: 2)
                    subject.append(item: 3)
                    subject.append(item: 4)
                }
                
                it("doubles the internal array before adding the item") {
                    expect(subject.backingArray.count).to(equal(8))
                }
            }
        }
        
        describe("#removeLast()") {
            var removedItem: Int!
            
            describe("when array is empty") {
                beforeEach {
                    removedItem = subject.removeLast()
                }
                
                it("returns nil") {
                    expect(removedItem).to(beNil())
                }
            }
            
            describe("when array is NOT empty") {
                describe("when backing array doesn't require a resize (shrinkage)") {
                    beforeEach {
                        subject.append(item: 0)
                        subject.append(item: 1)
                        
                        removedItem = subject.removeLast()
                    }
                    
                    it("removes the last item in the array and returns it") {
                        expect(removedItem).to(equal(1))
                    }
                    
                    it("doesn't shrink the array") {
                        expect(subject.backingArray.count).to(equal(2))
                    }
                }
                
                describe("when backing array requires a resize") {
                    beforeEach {
                        subject.append(item: 0)
                        subject.append(item: 1)
                        subject.append(item: 2)
                        subject.append(item: 3)

                        _ = subject.removeLast()
                        _ = subject.removeLast()

                        removedItem = subject.removeLast()
                    }

                    it("removes the item and halves the backing array") {
                        expect(removedItem).to(equal(1))
                        expect(subject.backingArray.count).to(equal(2))
                    }
                }
            }
        }
        
        describe("#remove(index:)") {
            var removedItem: Int!
            
            describe("when array is empty") {
                beforeEach {
                    removedItem = subject.remove(index: 0)
                }
                
                it("returns nil") {
                    expect(removedItem).to(beNil())
                }
            }
            
            describe("when array is NOT empty") {
                describe("when backing array doesn't require a resize (shrinkage)") {
                    beforeEach {
                        subject.append(item: 0)
                        subject.append(item: 1)
                        
                        removedItem = subject.remove(index: 0)
                    }
                    
                    it("removes the last item in the array and returns it") {
                        expect(removedItem).to(equal(0))
                    }
                    
                    it("doesn't shrink the array") {
                        expect(subject.backingArray.count).to(equal(2))
                    }
                }
                
                describe("when backing array requires a resize") {
                    beforeEach {
                        subject.append(item: 0)
                        subject.append(item: 1)
                        subject.append(item: 2)
                        subject.append(item: 3)
                        
                        _ = subject.remove(index: 0)
                        _ = subject.remove(index: 0)
                        
                        removedItem = subject.remove(index: 0)
                    }
                    
                    it("removes the item and halves the backing array") {
                        expect(removedItem).to(equal(2))
                        expect(subject.backingArray.count).to(equal(2))
                    }
                }
            }
        }
    }
}
