//
//  ButtonView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/25/21.
//

import SwiftUI
struct ButtonView: View {
    @Binding var menuItem: MenuItem
    @ObservedObject var cart = MenuManager.instance.cart
    
    var body: some View {
        Button(action: {
            menuItem.addedToCart = true
            cart.addToCart(menuItem)
            
        }, label: {
            Text("Add to Cart")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.regular)
                .padding(4.0)
            
        })
        .background(Color.red)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 7, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}
