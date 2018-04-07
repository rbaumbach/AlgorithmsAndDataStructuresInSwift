import Foundation

struct BubbleSort {
    func inPlaceSort(array: inout [Int]) {
        var endIndexOfUnsortedArray = array.count - 1

        while (endIndexOfUnsortedArray > 0) {
            completeSingleBubbleUp(array: &array, endIndexOfUnsortedItems: endIndexOfUnsortedArray)

            endIndexOfUnsortedArray = endIndexOfUnsortedArray - 1
        }
    }
    
    func swiftyInPlaceSort(array: inout [Int]) {
        for endIndex in (0..<array.count).reversed() {
            completeSingleBubbleUp(array: &array, endIndexOfUnsortedItems: endIndex)
        }
    }
    
    private func completeSingleBubbleUp(array: inout [Int], endIndexOfUnsortedItems: Int) {
        for index in 0..<endIndexOfUnsortedItems {
            if array[index] > array[index + 1] {
                swap(array: &array, firstElement: index, secondElement: index + 1)
            }
        }
    }
    
    private func swap(array: inout [Int], firstElement: Int, secondElement: Int) {
        let temp = array[firstElement];
        array[firstElement] = array[secondElement]
        array[secondElement] = temp
    }
}
