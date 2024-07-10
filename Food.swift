//
//  Food.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/2/24.
//

import Foundation

struct Food:Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
    let image: String
    let ingredients: [Ingredient]
    let price: Double
}

extension Food {
    static var doubleDouble: Food {
        Food(id: "101",
             name: "Double Double",
             description: "Freshly baked buns, American cheese, two beef patties, fleshly sliced or grilled onions, lettuce, spread, and tomatoes.",
             image: "doubleDouble",
             ingredients: [.salt, .patty, .onion, .tomato, .pepper, .mayo, .cheese, .ketchup, .lettuce],
             price: 3.95)
    }
}

extension Array where Element == Food {
    static var inNOut: [Food] {
        [Food(id: "100",
              name: "Double Double",
              description: "Freshly baked buns, American cheese, two beef patties, fleshly sliced or grilled onions, lettuce, spread, and tomatoes.",
              image: "doubleDouble",
                ingredients: [.salt, .patty, .onion, .tomato, .pepper, .mayo, .cheese, .ketchup],
              price: 3.95),
         Food(id: "101",
              name: "Chocolate Shake",
              description: "Chocolate, strawberry or vanilla made with real ice cream.",
              image: "inNOutChocolateShake",
               ingredients: [],
              price: 2.50),
         Food(id: "102",
              name: "French Fries",
              description: "Fresh, hand-cut potatoes prepared in 100% sunflower oil.",
              image: "inNOutFrenchFries",
               ingredients: [.salt, .onion, .tomato, .pepper, .mayo, .cheese, .ketchup],
              price: 1.85),
         Food(id: "103",
              name: "Animal Style Fries",
              description: "Secret but unique fries, topped with cheese, spread, and grilled onions.",
              image: "animalStyleFries",
                ingredients: [],
              price: 4.25)]
    }
    
    static var fiveGuys: [Food] {
        [Food(id: "200",
              name: "Cheeseburger",
              description: "American-style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.",
              image: "fiveGuysCheeseburger",
              ingredients: [.mushroom, .cheese, .ketchup, .mayo, .lettuce, .onion, .patty, .salt, .tomato],
              price: 7.69),
         Food(id: "201",
              name: "Fries",
              description: "Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil. Cut fresh and cooked twice - firm on the outside and mashed potato on the inside.",
              image: "fiveGuysFries",
                ingredients: [],
              price: 5.19),
         Food(id: "202",
              name: "Milkshake",
              description: "Fresh strawberries in homemade simple syrup.",
              image: "fiveGuysMilkshake",
                ingredients: [],
              price: 5.19),
         Food(id: "203",
              name: "Veggie Sandwich",
              description: "Freshly grilled onions, mushrooms and green peppers layered with lettuce and tomatoes on a soft, toasted sesame seed bun.",
              image: "fiveGuysSandwich",
                ingredients: [.mushroom, .cheese, .ketchup, .mayo, .lettuce, .onion, .salt, .tomato],
              price: 6.59)]
    }
    
    static var subway: [Food] {
        [Food(id: "300",
              name: "Footlong Cookie",
              description: "The Footlong Cookie is back nationwide and better than ever after popping up in select restaurants on National Cookie Day",
              image: "footlongCookie",
               ingredients: [],
              price: 5),
         Food(id: "301",
              name: "Turkey Footlong",
              description: "Special and tasty recipe - Turkey, bacon, crispy onions, double portion of cheese, tomatoes, cucumbers, and Caesar sauce!",
              image: "footlong",
               ingredients: [.cheese, .mayo, .lettuce, .onion, .salt, .tomato],
              price: 8.59),
         Food(id: "302",
              name: "Salad",
              description: "Contains a double serving of chicken with melted mozzarella and cheddar mix, on iceberg, tomatoes, cucumbers, green peppers, olives and onions. Season with Crispy onion and sweet sauc!.",
              image: "salad",
                ingredients: [],
              price: 7.39),
         Food(id: "303",
              name: "Wrap",
              description: "Special and tasty recipe - chicken strips, bacon, crispy onions, double portion of cheese, tomatoes, cucumbers, and Caesar sauce!",
              image: "fiveGuysSandwich",
               ingredients: [.cheese, .mayo, .lettuce, .onion, .salt, .tomato, .pepper],
              price: 5.99)]
    }
}
