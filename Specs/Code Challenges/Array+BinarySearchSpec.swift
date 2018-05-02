import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Given a sorted array, implement a binary search.  If item is found, return true, if item is NOT found
//          return false
//          ex: sorted array = [2, 4, 6, 8, 10, 20, 30, 40, 50, 100]
//          A search for 4 -> true, a search for 77 -> false


class Array_BinarySearchSpec: QuickSpec {
    override func spec() {
        var subject: Array<Int>!
        
        beforeEach {
            subject = [2, 4, 6, 8, 10, 20, 30, 40, 50, 100]
        }
        
        describe("binarySearch(item:)") {
            var hasFoundItem: Bool!
            
            describe("when searched item is present in the subject") {
                beforeEach {
                    hasFoundItem = subject.binarySearch(item: 4)
                }

                it("returns true") {
                    expect(hasFoundItem).to(beTruthy())
                }
            }
            
            describe("when searched item is NOT present in the subject") {
                beforeEach {
                    hasFoundItem = subject.binarySearch(item: 77)
                }

                it("returns false") {
                    expect(hasFoundItem).to(beFalsy())
                }
            }
        }
        
        describe("recursiveBinarySearch(item:)") {
            var hasFoundItem: Bool!
            
            describe("when searched item is present in the subject") {
                beforeEach {
                    hasFoundItem = subject.binarySearch(item: 4)
                }
                
                it("returns true") {
                    expect(hasFoundItem).to(beTruthy())
                }
            }
            
            describe("when searched item is NOT present in the subject") {
                beforeEach {
                    hasFoundItem = subject.binarySearch(item: 77)
                }
                
                it("returns false") {
                    expect(hasFoundItem).to(beFalsy())
                }
            }
        }
    }
}
