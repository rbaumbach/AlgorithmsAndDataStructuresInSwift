import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Given a sorted array, implement a binary search.  If item is found, return the index, if item is NOT found
//          return -1
//          ex: sorted array = [2, 4, 6, 8, 10, 20, 30, 40, 50, 100]
//          A search for 4 -> true, a search for 77 -> false


class Array_BinarySearchSpec: QuickSpec {
    override func spec() {
        var subject: Array<Int>!
        
        beforeEach {
            subject = [2, 4, 6, 8, 10, 20, 30, 40, 50, 100]
        }
        
        describe("binarySearch(item:)") {
            var indexOfFoundItem: Int!
            
            describe("when searched item is present in the subject") {
                beforeEach {
                    indexOfFoundItem = subject.binarySearch(item: 4)
                }

                it("returns the correct index") {
                    expect(indexOfFoundItem).to(equal(1))
                }
            }
            
            describe("when searched item is NOT present in the subject") {
                beforeEach {
                    indexOfFoundItem = subject.binarySearch(item: 77)
                }

                it("returns -1") {
                    expect(indexOfFoundItem).to(equal(-1))
                }
            }
        }
        
        describe("recursiveBinarySearch(item:)") {
            var indexOfFoundItem: Int!
            
            describe("when searched item is present in the subject") {
                beforeEach {
                    indexOfFoundItem = subject.binarySearch(item: 4)
                }
                
                it("returns the correct index") {
                    expect(indexOfFoundItem).to(equal(1))
                }
            }
            
            describe("when searched item is NOT present in the subject") {
                beforeEach {
                    indexOfFoundItem = subject.binarySearch(item: 77)
                }
                
                it("returns -1") {
                    expect(indexOfFoundItem).to(equal(-1))
                }
            }
        }
    }
}
