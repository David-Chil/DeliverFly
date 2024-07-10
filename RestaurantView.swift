//
//  RestaurantView.swift
//  DeliverflyNeliShahapuniG1
//
//  Created by user on 7/3/24.
//

import SwiftUI

struct RestaurantView: View {
    @EnvironmentObject private var navigation: Navigation
    let restaurant: Restaurant
    @State private var selectedFood: Food?
    @State private var hasCartItems = false
    @State private var order: Order
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        self.order = Order(
            id: String(Int.random(in: 10000..<99999)),
            date: Date().formatted(.dateTime.day(.twoDigits).month(.wide).year(.defaultDigits)),
            restaurant: .init(name: restaurant.name, image: restaurant.image),
            items: [],
            deliveryPrice: 0.0
        )
    }
    
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    backButton
                    Text("Restaurant")
                    Spacer()
                    cartButton
                }
                restaurantImage
                nameText
                descriptionText
                menuText
                foodsGrid
            }
            .padding(.horizontal)
        }
        .sheet(item: $selectedFood) { item in
            FoodView(food: item, orderItems: $order.items)
                .presentationDetents(item.ingredients.isEmpty ? [.fraction(0.63)] : [.fraction(0.93)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(30)
        }
        .onChange(of: order.items.isEmpty) {
            withAnimation(.easeInOut(duration: 0.3)) {
                hasCartItems.toggle()
            }
        }
    }
    var cartButton: some View{
        Button(action: {
            navigation.goTo(view: .order(info: $order))
        }, label: {
            Image(.bag)
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(hasCartItems ? .white : .gray)
                .background(hasCartItems ? .darkBlue : .lightGray)
                .clipShape(Circle())
                .overlay(alignment: .topTrailing)   {
                    if hasCartItems {
                        Text(String(order.items.count))
                            .frame(width:30, height: 30)
                            .foregroundStyle(.white)
                            .background(.darkOrange)
                            .clipShape(Circle())
                            .offset(y: -5)
                            .transition(.scale)
                    }
                }
                
        })
        .disabled(!hasCartItems)
        
        
    }
    var foodsGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], content: {
            ForEach(restaurant.foods, id: \.self) { food in
                Button(action: {
                    selectedFood = food
                }, label: {
                    FoodPreview(food: food)
                        .frame(height: 200)
                })
            }
        })
    }
    var menuText: some View {
        Text("Menu")
            .font(.title3)
            .padding(.vertical)
    }
    var descriptionText: some View {
        Text(restaurant.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
    }
    var nameText: some View {
        Text(restaurant.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
            .padding(.vertical, 5)
    }
    var restaurantImage: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.vertical)
            .allowsHitTesting(false)
    }
    var backButton: some View {
        Button(action: {
            navigation.goBack()
        }, label: {
            Image(.backArrow)
                .frame(width: 50, height: 50)
                .background(.lightGray)
                .clipShape(Circle())
                .padding(.trailing)
        })
    }
}

#Preview {
    RestaurantView(restaurant: .inNOut)
}
