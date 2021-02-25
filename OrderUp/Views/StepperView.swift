//
//  StepperView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/25/21.
//

import SwiftUI

struct StepperView: View {
    @State var amount = 1
    @Binding var menuItem: MenuItem
    @ObservedObject var cart = MenuManager.instance.cart
    
    var body: some View {
        Stepper(
            onIncrement: {
                amount += 1
                cart.addToCart(menuItem)
            },
            onDecrement: {
                if amount > 1 {
                    amount -= 1
                    cart.removeFromCart(menuItem)
                } else if amount == 1 {
                    amount -= 1
                    cart.removeFromCart(menuItem)
                    menuItem.addedToCart = false
                }
            },
            label: {
                Text("\(amount)")
            })
    }
}
