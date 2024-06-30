//
//  DeliverFlyApp.swift
//  DeliverFly
//
//  Created by user on 6/16/24.
//

import SwiftUI


@main
struct DeliverFlyApp: App {
    @ObservedObject private var navigation = Navigation()
    @State private var isSplash = true
    
    
    var body : some Scene {
        WindowGroup{
            if isSplash{
                SplashView()
                    .onAppear(perform:{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            isSplash = false;
                        }
                    })
            }else{
                NavigationStack(path: $navigation.navPath) {
                    HomeView()
                        .navigationBarBackButtonHidden()
                        .navigationDestination(for: Navigation.View.self) { view in
                            switch view {
                            case .restaurant(info: let info):
                                RestaurantView(restaurant: info)
                                    .navigationBarBackButtonHidden(true)
                            }
                            
                        }
                }
                .environmentObject(navigation)
            
            }
        }
    }
}
