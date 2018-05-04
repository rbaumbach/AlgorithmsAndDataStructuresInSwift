import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Determine if a given integer is prime.  A number is prime if it is only divisible by 1 and itself
//          ex: 1 -> true, 2 -> true, 3 -> true, 7 -> true
//          ex: 4 -> false, 100 -> false, 121 -> false

class Int_PrimeSpec: QuickSpec {
    override func spec() {
        describe("#isPrime()") {
            describe("when a number is prime") {
                it("returns true") {
                    expect(1.isPrime()).to(beTruthy())
                    expect(2.isPrime()).to(beTruthy())
                    expect(3.isPrime()).to(beTruthy())
                    expect(7.isPrime()).to(beTruthy())
                }
            }
            
            describe("when a number is NOT prime") {
                it("returns false") {
                    expect(4.isPrime()).to(beFalsy())
                    expect(100.isPrime()).to(beFalsy())
                    expect(121.isPrime()).to(beFalsy())
                }
            }
        }
        
        describe("#betterIsPrime()") {
            describe("when a number is prime") {
                it("returns true") {
                    expect(1.betterIsPrime()).to(beTruthy())
                    expect(2.betterIsPrime()).to(beTruthy())
                    expect(3.betterIsPrime()).to(beTruthy())
                    expect(7.betterIsPrime()).to(beTruthy())
                }
            }
            
            describe("when a number is NOT prime") {
                it("returns false") {
                    expect(4.betterIsPrime()).to(beFalsy())
                    expect(9.betterIsPrime()).to(beFalsy())
                    expect(100.betterIsPrime()).to(beFalsy())
                    expect(121.betterIsPrime()).to(beFalsy())
                }
            }
        }
    }
}
