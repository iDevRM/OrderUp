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
                    ListRowView(menuItem: item )
                    
                }
            }
            .navigationBarTitle("Food Menu")
            .navigationBarItems(trailing: CartView(amount: cart.cartItems.count))
            
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
