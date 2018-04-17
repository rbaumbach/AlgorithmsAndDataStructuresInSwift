import UIKit

class AsyncEvenOddStringConcatenation {
    // MARK: - Given property and methods
    
    var testLabel: UILabel = UILabel()
    
    private func getRemoteFirstString(completionBlock: @escaping (String) -> Void) {
        completionBlock("Billy")
    }

    private func getRemoteSecondString(completionBlock: @escaping (String) -> Void) {
        completionBlock("Goat")
    }
    
    // MARK: - Methods to implement
    
    func buildString(using integer: Int, completionBlock: @escaping (String) -> Void) {
        if integer % 2 == 0 {
            getRemoteFirstString { [weak self] firstString in
                self?.getRemoteSecondString(completionBlock: { secondString in
                    completionBlock(firstString + secondString)
                })
            }
        } else {
            getRemoteFirstString { string in
                completionBlock(string)
            }
        }
    }
    
    func buildStringForLabel(using integer: Int) {
        if integer % 2 == 0 {
            getRemoteFirstString { [weak self] firstString in
                self?.getRemoteSecondString(completionBlock: { [weak self] secondString in
                    self?.testLabel.text = firstString + secondString
                })
            }
        } else {
            getRemoteFirstString { [weak self] firstString in
                self?.testLabel.text = firstString
            }
        }
    }
}
