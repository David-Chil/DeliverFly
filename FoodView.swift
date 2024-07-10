//
//  FoodView.swift
//  DeliverflyNeliShahapuniG1
//
//  Created by user on 7/3/24.
//

import SwiftUI

struct FoodView: View {
    let food: Food
    @Environment (\.dismiss) private var dismiss
    @State private var selectedIngredients: [Ingredient] = []
    @State private var quantity: Int = 1
    @Binding var orderItems: [Item]
    private var total: Double {
        food.price*Double(quantity)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                image
                VStack(alignment: .leading) {
                    title
                    description
                    if !food.ingredients.isEmpty {
                        Text("Ingredients".uppercased())
                            .padding(.vertical)
                            .kerning(1.0)
                            .font(.footnote)
                            .foregroundStyle(.darkGray)
                        ingredintsList
                    }
                }
                .padding()
            }
            
            Group {
                Divider()
                HStack{
                    totalPrice
                    Spacer()
                    itemQuantity
                }
                addToCart
            }
            .padding(.horizontal)
        }
    }

    var addToCart: some View {
        Button(action: {
            let item = Item(
                food: food,
                quantity: quantity,
                extras: selectedIngredients
                )
            orderItems.append(item)
            dismiss()
        }, label: {
            Text("Add to Cart".uppercased())
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(quantity == 0 ? .gray : .white)
                .background(quantity == 0 ? .lightGray : .darkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .disabled(quantity == 0)
    }
    
    var itemQuantity: some View {
        Group {
            Button(action: {
                if quantity > 0 {
                    quantity -= 1
                }
            }, label: {
                Text("-")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(Circle())
            })
            Text("\(quantity)")
                .bold()
                .padding(.horizontal)
            Button(action: {
                if quantity < 10 {
                    quantity += 1
                }
            }, label: {
                Text("+")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(Circle())
            })
        }
    }
    var totalPrice: some View {
        Text(total, format: .currency(code: "USD"))
            .font(.title)
            .fontWeight(.medium)
            .padding(.vertical, 10)
    }
    
    var ingredintsList: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50), alignment: .top)], content: {
            ForEach(food.ingredients, id: \.self) { ingredient in
                Button(action: {
                   ingredientTapped(ingredient)
                }, label: {
                    ingredientButton(ingredient)
                })
            }
        })
    }
    func ingredientTapped(_ ingredient: Ingredient) {
        if selectedIngredients.contains(where: {$0 == ingredient}) {
            selectedIngredients.removeAll { $0 == ingredient }
        } else if selectedIngredients.count < 3 {
            selectedIngredients.append(ingredient)
        }
    }
 
    @ViewBuilder func ingredientButton(_ ingredient: Ingredient) -> some View {
        VStack {
            Image(ingredient.rawValue)
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(isSelected(ingredient) ? .lightOrange : .darkOrange)
                .background(isSelected(ingredient) ? .darkOrange : .lightOrange)
                .clipShape(Circle())
            Text(ingredient.rawValue.capitalized)
                .font(.footnote)
                .foregroundStyle(.darkGray)
        }
    }
    func isSelected(_ ingredient: Ingredient) -> Bool {
        selectedIngredients.contains{ $0 == ingredient }
    }
    
    var title: some View {
        Text(food.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
    }
    var description: some View {
        Text(food.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
            .padding(.top, 5)
            .lineLimit(2)
    }
    
    var image: some View {
        Image(food.image)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 30,
                    bottomTrailingRadius: 30,
                    topTrailingRadius: 0
                )
            )
    }
}

#Preview {
    FoodView(food: .doubleDouble, orderItems: .constant(.previewDataArray))
}
