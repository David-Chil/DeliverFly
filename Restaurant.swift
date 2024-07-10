//
//  Restaurant.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/2/24.
//

import Foundation

struct Restaurant: Hashable {
    let id: String
    let name: String
    let description: String
    let image: String
    let rating: Double
    let time: Int
    let foods: [Food]
}

extension Restaurant {
    static var inNOut: Restaurant {
        Restaurant(id: "1",
                   name: "In-N-Out Burger",
                   description: "From the first bite of your burger to your last french fry, quality is the most important ingredient at In-N-Out Burger.",
                   image: "inNOut",
                   rating: 5.0,
                   time: 20,
                   foods: .inNOut)
    }
}

extension Array where Element == Restaurant {
    static var restaurants: [Restaurant] {
        [Restaurant(
            id: "1",
            name: "In-N-Out Burger",
            description: "From the first bite of your burger to your last french fry, quality is the most important ingredient at In-N-Out Burger.",
            image: "inNOut",
            rating: 5.0,
            time: 20,
            foods: .inNOut
        ),
         Restaurant(
            id: "2",
            name: "Five Guys",
            description: "Five Guys' passion for food is shared with our fans, which is why we never compromise. Fresh ingredients hand-prepared that satisfy your craving.",
            image: "fiveGuys",
            rating: 4.7,
            time: 45,
            foods: .fiveGuys
         ),
         Restaurant(
            id: "3",
            name: "Subway",
            description: "The Subway menu offers a wide range of sandwiches, salads and wraps. View the abundant options on the Subway menu and place your order online.",
            image: "subway",
            rating: 3.5,
            time: 50,
            foods: .subway
         )]
    }
}
