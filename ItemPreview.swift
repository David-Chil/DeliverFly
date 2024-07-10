//
//  ItemPreview.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/4/24.
//

import SwiftUI

struct ItemPreview: View {
    let item: Item
    var body: some View {
        HStack {
            image
            VStack{
                name
                if item.extras.isEmpty {
                    itemDescription
                }else {
                    extras
                }
                Spacer()
                
                HStack(alignment: .lastTextBaseline) {
                    price
                    
                }
                
            }
        }
        .padding([.top, .horizontal])
    }
    var image: some View {
        Image(item.food.image)
            .resizable()
            .scaledToFill()
            .frame(width:150, height: 140)
            .cornerRadius(15)
        
        
    }
    var name: some View {
        Text(item.food.name)
            .font(.title2)
    }
    
    var extras: some View {
        ForEach(item.extras, id: \.self) { extra in
            Text("+ \(extra)")
                .foregroundStyle(.gray)
                .bold()
            
            
        }
        
    }
    var price: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(item.food.price, format: .currency(code: "USD"))
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, -5)
            if item.quantity > 1 {
                Text("x\(item.quantity) item")
                    .font(.subheadline)
                    .kerning(1)
            }
        }
        
    }

    var itemDescription: some View {
        Text("\(item.food.description)")
            .font(.subheadline)
            .foregroundStyle(.gray)
            .lineLimit(3)
    }
}

#Preview {
    ItemPreview(item: .previewData)
}
