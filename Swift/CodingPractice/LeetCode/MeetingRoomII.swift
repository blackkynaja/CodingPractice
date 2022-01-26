/*
 https://leetcode.com/problems/meeting-rooms-ii/
 
 Topics: Array, Two Pointers, Greedy, Sorting, Heap
 */

class MeetingRoomII {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var starts = intervals.map { (items) -> Int in
            return items[0]
        }
        starts = starts.sorted()
        
        var ends = intervals.map { (items) -> Int in
            return items[1]
        }
        ends = ends.sorted()
        
        var minRoom = 0
        var endIndex = 0
        for start in starts {
            if start < ends[endIndex] {
                minRoom+=1
            } else {
                endIndex+=1
            }
        }
        
        return minRoom
    }
}
