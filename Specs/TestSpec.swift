import Quick
import Nimble

class TestSpec: QuickSpec {
    override func spec() {
        describe("A spec") {
            it("always passes") {
                expect(true).to(beTruthy())
            }
        }
    }
}
