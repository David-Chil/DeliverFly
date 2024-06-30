//
//  Navigation.swift
//  DeliverFly
//
//  Created by user on 6/23/24.
//

import Foundation
import SwiftUI

class Navigation: ObservableObject {
    @Published var navPath = NavigationPath()
    
    enum View: Hashable{
        case restaurant(info: Restaurant)
    }
    func goTo(view:View) {
        navPath.append(view)
    }
    func goBack(){
        navPath.removeLast()
    }
}
