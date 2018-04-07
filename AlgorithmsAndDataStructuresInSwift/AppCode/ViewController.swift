import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var array = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
        
        let bubbleSort = BubbleSort()
        
        bubbleSort.inPlaceSort(array: &array)
        
        print(array)
        
        var secondArray = [99, 88, 77, 66, 55, 44, 33, 22, 11, 0]
        
        bubbleSort.swiftyInPlaceSort(array: &secondArray)
        
        print(secondArray)
    }
}
