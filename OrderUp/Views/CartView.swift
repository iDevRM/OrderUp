//
//  CartView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import SwiftUI

struct CartView: View {
    var cartItems: Int
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(maxWidth: 22)
                Text("\(cartItems)")
                    .foregroundColor(.white)
            }
            .opacity(cartItems > 0 ? 1 : 0)
            .offset(x: 15, y: -15)
        }
    }
}
