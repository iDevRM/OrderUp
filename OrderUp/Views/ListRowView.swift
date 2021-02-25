//
//  ListRowView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/25/21.
//

import SwiftUI

struct ListRowView: View {
    @State var menuItem: MenuItem
    @ObservedObject var cart = MenuManager.instance.cart
    var body: some View {
        HStack {
            Image("\(menuItem.image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)
                .cornerRadius(15)
                .shadow(radius: 5 )
            VStack(alignment:.leading) {
                Text("\(menuItem.id)")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("\(menuItem.description)")
                    .padding(.bottom)
                    .foregroundColor(.gray)
                HStack {
                    Text("$\(String(format: "%.2f",menuItem.price ))")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    Spacer()
                    
                    if !cart.cartItems.contains { $0.id == menuItem.id } {
                        ButtonView(menuItem: $menuItem)
                    } else {
                        StepperView(menuItem: $menuItem)
                    }
                }
            }
        }
    }
}
