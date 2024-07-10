//
//  DeliverflyDavidChilingaryanApp.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/2/24.
//

import SwiftUI
import FirebaseCore

@main
struct DeliverflyDavidChilingaryanApp: App {
    @ObservedObject private var navigation = Navigation()
    @ObservedObject private var firebase: Firebase
    @State private var isSplash = true
    
    init() {
        FirebaseApp.configure()
        firebase = Firebase()
    }
    
    var body: some Scene {
        WindowGroup {
            if isSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isSplash = false
                        }
                    }
            } else {
                NavigationStack(path: $navigation.path){
                    HomeView()
                        .navigationBarBackButtonHidden()
                        .navigationDestination(for: Navigation.View.self) { view in
                            switch view {
                            case .restaurant(info: let info):
                                RestaurantView(restaurant: info)
                                    .navigationBarBackButtonHidden()
                            case .order(info: let info, isOrdering: let isOrdering):
                                OrderView(order:info, isOrdering: isOrdering)
                                    .navigationBarBackButtonHidden()
                            case .history:
                                HistoryView()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                    
                }
                .environmentObject(navigation)
                .environmentObject(firebase)
            }
            
        }
    }
}


