//
//  SplashView.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/2/24.
//

import SwiftUI

struct SplashView: View {
    @State private var animationValue = 0.5
    var body: some View {
        VStack {
            logo
            text
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkOrange)
        .animation(.easeInOut(duration: 1.5),value: animationValue)
        .onAppear {
            animationValue = 1.0
        }
        
        
    }
    var logo: some View {
        Image(.logo)
            .colorInvert()
            .scaleEffect(animationValue)
    }
    var text: some View {
        HStack {
            Text("DeliverFly")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding()
                .fontWeight(.medium)
                
        }
    }
}

#Preview {
    SplashView()
}
