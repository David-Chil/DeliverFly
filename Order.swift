//
//  Order.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/4/24.
//

import Foundation

struct Order:Hashable {
    let id: String
    let date:String
    let restaurant:Restaurant
    var items:[Item]
    let deliveryPrice: Double
    var total: Double {
        items.map { Double($0.quantity) * $0.food.price}.reduce(0,+)
        
    }
    struct Restaurant:Hashable {
        let name:String
        let image:String
    }
}
extension Order {
    static var previewData: Order {
        Order(id: "12345",
              date: "April 21, 2024",
              restaurant: .init(name: "In-n-Out Burger", image: "inNOut"),
              items: .previewDataArray,
              deliveryPrice: 0.0)
    }
}

extension Array where Element == Order {
    static var previewDataArray: [Order] {
        [Order(id: "12345",
               date: "May 10, 2024",
               restaurant: .init(name: "In-n-Out Burger", image: "inNOut"),
               items: .previewDataArray,
               deliveryPrice: 0.0),
         Order(id: "99999",
               date: "April 21, 2024",
               restaurant: .init(name: "Five Guys", image: "fiveGuys"),
               items: .previewDataArray,
               deliveryPrice: 0.0),
         Order(id: "12345",
               date: "April 08, 2024",
               restaurant: .init(name: "Subway", image: "subway"),
               items: .previewDataArray,
               deliveryPrice: 0.0)]
    }
}

