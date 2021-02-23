//
//  ContentView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/11/21.
//

import SwiftUI

struct OrderView: View {
    @State var categories = StoredData.categories
    @State var menuItems = StoredData.pizzaItems
    
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var storedData: StoredData
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Categories")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .offset(x: -150)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 50) {
                        ForEach(categories) { item in
                            CategoryRowView(category: item)
                        }
                    }
                    .frame(maxHeight: 200)
                    .offset(x: 35)
                }
                Text("Menu")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .offset(x: -170)
                
                List(storedData.menuItems) { item in
                    ListRowView(menuItem: item )
                        
                }
            }
            .navigationBarItems(trailing: CartView(cartItems: cart.cartItems))
        }
    }
}

struct ListRowView: View {
    @State var menuItem: MenuItem
    
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
                    
                    if !menuItem.addedToCart {
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
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        Button(action: {
            menuItem.addedToCart = true
            cart.addToCart(menuItem)
            print(cart.cartItems,cart.cartItems.count)
            
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
    @State private var amount = 1
    @Binding var menuItem: MenuItem
    @EnvironmentObject var cart: Cart
    var body: some View {
        Stepper(
            onIncrement: {
                print("increment")
                amount += 1
                cart.addToCart(menuItem)
                print(cart.cartItems,cart.cartItems.count)
                
            },
            onDecrement: {
                print("decrement")
                if amount > 1 {
                    amount -= 1
                    cart.removeFromCart(menuItem)
                } else if amount == 1 {
                    amount -= 1
                    cart.removeFromCart(menuItem)
                    menuItem.addedToCart = false
                }
                
                print(cart.cartItems,cart.cartItems.count)
            },
            label: {
                Text("\(amount)")
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Cart())
            .environmentObject(StoredData())
    }
}
