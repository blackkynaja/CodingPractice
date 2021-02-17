//
//  Delivery.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/16/21.
//

import Foundation

private struct Customer {
    let distance: Double
    let receiveTime: Double
    let receiveBufferTime: Double
}

private struct Shopper {
    let distance: Double
    let velocity: Double
    let timeSpendInStore: Double
}

func delivery(order: [Int], shoppers: [[Int]]) -> [Bool] {
    
    var results = [Bool]()
    
    let customerOrder = Customer(distance: Double(order[0]), receiveTime: Double(order[1]), receiveBufferTime: Double(order[2]))
    let itemShoppers = shoppers.map { (items) -> Shopper in
        return Shopper(distance: Double(items[0]), velocity: Double(items[1]), timeSpendInStore: Double(items[2]))
    }
    
    for itemShopper in itemShoppers {
        let timeSpend = (customerOrder.distance + itemShopper.distance)/itemShopper.velocity + itemShopper.timeSpendInStore
        if timeSpend >= customerOrder.receiveTime && timeSpend <= customerOrder.receiveTime+customerOrder.receiveBufferTime {
            results.append(true)
        } else {
            results.append(false)
        }
    }
    
    return results
}
