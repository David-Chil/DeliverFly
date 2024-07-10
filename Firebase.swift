//
//  Firebase.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/8/24.
//

import Foundation
import FirebaseDatabase

class Firebase: ObservableObject {
    let database = Database.database(url: "https://deliverflydavidchilingaryan-default-rtdb.firebaseio.com/").reference()
    
    @Published var restaurants: [Restaurant] = []
    func fetchData() async {
        let ids = ["1", "2", "3"]
        let restaurantsData = try? await database.child("Restaurants").getData()
        let foodsData = try? await database.child("Foods").getData()
        
        await MainActor.run {
            restaurants = ids.reduce(into: [Restaurant](), { restaurants, id in
                restaurantsData?.decodeRestaurant(id: id, foodsData: foodsData ).map {
                    restaurants.append($0)}
                })
            }
        }
    func placeOrder(_ order: Order) async {
        let newOrder = database.child("Orders").child(String(order.id))
        
        do {
            try await newOrder.child("date").setValue(order.date)
            try await newOrder.child("restaurant").child("name").setValue(order.restaurant.name)
            try await newOrder.child("restaurant").child("image").setValue(order.restaurant.image)
            
            for(index, item) in order.items.enumerated() {
                let itemRef = newOrder.child("items").child(String(index))
                try await itemRef.child("id").setValue(item.food.id)
                try await itemRef.child("quantity").setValue(item.quantity)
                
                for(index, extra) in item.extras.enumerated() {
                    let extraRef = itemRef.child("extras").child(String(index))
                    try await extraRef.setValue(order.total)
                }
            }
        } catch {
            print(error)
        }
    }
    }


extension DataSnapshot {
    func decodeRestaurant(id: String, foodsData: DataSnapshot?) -> Restaurant? {
        guard let restaurant = self.childSnapshot(forPath: id).value as? [String: AnyObject]
        else { return nil }
        let name = restaurant["name"] as?  String ?? ""
        let description = restaurant["description"] as? String ?? ""
        let image = restaurant["image"] as? String ?? ""
        let time = restaurant["time"] as? Int ?? 0
        let rating = restaurant["rating"] as? Double ?? 0.0
        let foods: [Food] = (restaurant["foods"] as? [String] ?? []).reduce(into: [Food]()) {
            newArray, id in
            foodsData?.decodeFood(id: id).map { newArray.append($0) }
        }
        
        return Restaurant(id: id, name: name, description: description, image: image, rating: rating, time: time, foods: foods)
    }
    func decodeFood(id: String) -> Food? {
        guard let food = self.childSnapshot(forPath: id).value as? [String: AnyObject] else { return nil }
        
        let name = food["name"] as?  String ?? ""
        let description = food["description"] as? String ?? ""
        let image = food["image"] as? String ?? ""
        let ingredients = (food["ingredients"] as? [String] ?? []).reduce(into: [Ingredient]()) {
            newArray, ingredient in
            Ingredient(rawValue: ingredient).map {newArray.append($0)}
        }
        let price = food["price"] as? Double ?? 0.0
        
        return Food(id: id, name: name, description: description, image: image, ingredients: ingredients, price: price)
    }
    
}
