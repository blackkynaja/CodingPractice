//
//  MinimumTimetoCompleteTrips.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/26/22.
//

/*
 https://leetcode.com/problems/minimum-time-to-complete-trips/
 
 Topics:
 */

class MinimumTimetoCompleteTrips {
    func getTotalTripAtTime(_ dict: [Int:Int], _ time: Int) -> Int {
        var totalTrip = 0
        for (key, value) in dict {
            if key <= time {
                totalTrip += time/key*value
            }
        }
        return totalTrip
    }
    
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var dict = [Int:Int]()
        let maxInt = time.min()!*totalTrips
        
        time.forEach {
            dict[$0] = dict[$0] == nil ? 1 : dict[$0]!+1
        }
        var current = maxInt
        var left = 1
        var right = maxInt
        var mid = (left + right)/2
        while left <= right {
            mid = (left + right)/2
            current = getTotalTripAtTime(dict, mid)
            if current >= totalTrips {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
