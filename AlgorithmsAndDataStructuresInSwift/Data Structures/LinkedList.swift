import Foundation

protocol LinkedList {
    func isEmpty() -> Bool
    func peek() -> Int?
    
    func addToFront(item: Int)
    func removeFromFront() -> Int?
    
    func addToBack(item: Int)
    func removeFromBack() -> Int?
}
