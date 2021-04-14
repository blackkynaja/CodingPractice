/*
 https://leetcode.com/problems/moving-average-from-data-stream/
 */

class MovingAveragefromDataStream {
    class MovingAverage {

        /** Initialize your data structure here. */
        let size: Int
        var window = [Double]()
        var sum = 0.0
        var count = 0
        
        init(_ size: Int) {
            self.size = size
        }
        
        func next(_ val: Int) -> Double {
            if window.count < size {
                window.append(Double(val))
            } else {
                window[count%size] = Double(val)
            }
            count+=1
            return window.reduce(0,+)/Double(window.count)
        }
    }
}
