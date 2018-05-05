import Quick
import Nimble

@testable import AlgorithmsAndDataStructuresInSwift

// Problem: Output the Fibonacci series as an array (including 0) upto the n-th entry in the fibonacci series.
//          The fibonacci series is an ordering of numbers where each number is the sum of the preceeding two.
//          ex: 0 -> [0], 1 -> [0, 1], 2 -> [0, 1, 1], ... , 10 -> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

class FibonacciSpec: QuickSpec {
    override func spec() {
        var subject: Fibonacci!

        beforeEach {
            subject = Fibonacci()
        }

        describe("#generate(upto:)") {
            var fibonacciOutput: [Int]!

            describe("when number is < 0") {
                beforeEach {
                    fibonacciOutput = subject.generate(upto: -1)
                }
                
                it("returns an empty array") {
                    expect(fibonacciOutput).to(equal([]))
                }
            }

            describe("when number is >= 0") {
                it("generates an array of the fibonacci sequence output the number of times") {
                    expect(subject.generate(upto:0)).to(equal([0]))
                    expect(subject.generate(upto:1)).to(equal([0, 1]))
                    expect(subject.generate(upto:10)).to(equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]))
                }
            }
        }
        
        describe("#recursiveGenerate(upto:)") {
            var fibonacciOutput: [Int]!
            
            describe("when number is < 0") {
                beforeEach {
                    fibonacciOutput = subject.recursiveGenerate(upto: -1)
                }
                
                it("returns an empty array") {
                    expect(fibonacciOutput).to(equal([]))
                }
            }
            
            describe("when number is >= 0") {
                it("generates an array of the fibonacci sequence output the number of times") {
                    expect(subject.recursiveGenerate(upto:0)).to(equal([0]))
                    expect(subject.recursiveGenerate(upto:1)).to(equal([0, 1]))
                    expect(subject.recursiveGenerate(upto:10)).to(equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]))
                }
            }
        }
    }
}
