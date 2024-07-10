//
//  HistoryView.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/9/24.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject private var firebase:Firebase
    @State private var selectedOrder: Order?
    @State private var loadingOrders = true
    let orders: [Order] = .previewDataArray
    var body: some View {
        VStack {
            HStack {
                backButton
                Text("History")
                Spacer()
            }
            .padding(.horizontal)
            Spacer()
            historyView
            Spacer()
        }
        .task {
            // fetchOrders
        }
        .onDisappear() {
            //resetOrders
            loadingOrders = true
        }
    }
    @ViewBuilder var historyView: some View {
        if orders.isEmpty {
            if loadingOrders {
                ProgressView()
                    .task {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            loadingOrders = false
                        }
                    }
            } else {
                Text("No Orders")
                
            }
        } else  {
            VStack {
                ScrollView {
                    ForEach(orders, id: \.self) { order in
                        VStack(alignment:.center) {
                            OrderPreview(order: order)
                            viewOrderButton(order)
                        }
                        .padding(.horizontal)
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    @ViewBuilder func viewOrderButton(_ order:Order) -> some View {
        Button(action: {
            selectedOrder = order
            if let selectedOrder = Binding<Order>($selectedOrder) {
                navigation.goTo(view: .order(info: selectedOrder, isOrdering: false))
            }
        }, label: {
            Text("View Order")
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(.darkOrange)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.darkOrange, lineWidth: 2)
                )
        })
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
    HistoryView()
}
