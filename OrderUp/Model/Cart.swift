//
//  Cart.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/18/21.
//

import Foundation

class Cart: ObservableObject {
    @Published var cartItems = [MenuItem]()
    
    func addToCart(_ menuItem: MenuItem) {
        cartItems.append(menuItem)
    }
    
    func removeFromCart(_ menuItem: MenuItem) {
        if let index = cartItems.firstIndex(where: { $0.id == menuItem.id }) {
            cartItems.remove(at: index)
        }
    }
    
}
