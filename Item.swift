//
//  Item.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/4/24.
//

import Foundation


struct Item: Hashable {
    let food:Food
    let quantity:Int
    let extras:[Ingredient]
}

extension Item {
    static var previewData:Item {
        Item(food: .doubleDouble,
             quantity: 2,
             extras: [.ketchup, .onion, .cheese])
    }
}

extension Array where Element == Item {
    static var previewDataArray: [Item] {
        [Item(food: .doubleDouble,
              quantity: 2,
              extras: [.ketchup, .onion, .cheese]),
         Item(food:.doubleDouble,
             quantity: 1,
              extras: [.tomato])]
    }
}
