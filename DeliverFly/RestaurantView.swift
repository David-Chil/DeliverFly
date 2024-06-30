//
//  RestaurantView.swift
//  DeliverFly
//
//  Created by user on 6/18/24.
//

import SwiftUI

struct RestaurantView: View {
    @EnvironmentObject private var navigation: Navigation
    @State private var selectedFood: Food?
    let restaurant: Restaurant
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        navigation.goBack()
                    }, label: {
                        backButton
                    })
                    
                    Text("Restaurant")
                    Spacer()
                }
                
                restaurantImage
                nameText
                descriptionText
                
                Text("Menu")
                    .font(.title3)
                    .padding(.vertical)
                foodsGrid
            }
            .padding(.horizontal)
        }
        .sheet(item: $selectedFood) { item in
            FoodView(food: item)
                .presentationDetents(item.ingredients.isEmpty ? [.fraction(0.63)] : [.fraction(0.93)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(30)
        }
    }
    var backButton: some View {
        Image(.backArrow)
            .frame(width: 50, height: 50)
            .background(.lightGray)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding(.trailing)
    }
    var restaurantImage: some View{
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.vertical)
            .allowsTightening(false)
    }
    var nameText: some View {
        Text(restaurant.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
            .padding(.vertical, 5)
    }
    
    var descriptionText: some View {
        Text(restaurant.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
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
    
}

#Preview {
    RestaurantView(restaurant: .inNOut)
}














