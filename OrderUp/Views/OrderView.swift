//
//  ContentView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/11/21.
//

import SwiftUI

struct OrderView: View {
    @State var categories = MenuManager.instance.storedData.categories
    @ObservedObject var menuItems = MenuManager.instance.storedData
    @ObservedObject var cart = MenuManager.instance.cart
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                Text("Categories")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    
                
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(categories) { item in
                            CategoryRowView(category: item)
                        }
                    }
                    .frame(maxHeight: 200)
                    .offset(x: 35)
                }
                Text("Items")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    
                
                List(menuItems.items) { item in
                    ListRowView(menuItem: item)
                    
                }
            }
            .navigationBarTitle("Food Menu")
            .navigationBarItems(trailing: CartView(amount: cart.cartItems.count))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
