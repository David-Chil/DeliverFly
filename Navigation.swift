//
//  Navigation.swift
//  DeliverflyDavidChilingaryan
//
//  Created by user on 7/8/24.
//

import SwiftUI

class Navigation: ObservableObject {
    @Published var path = NavigationPath()
    
    enum View: Hashable {
        case restaurant(info: Restaurant)
        case order(info: Binding<Order>, isOrdering: Bool = true)
        case history
    }
    func goTo(view: View) {
        path.append(view)
    }
    func goBack() {
        path.removeLast()
    }
    func goToRoot(){
        path.removeLast(path.count)
    }
}
extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}
