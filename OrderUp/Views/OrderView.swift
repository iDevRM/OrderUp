//
//  ContentView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/11/21.
//

import SwiftUI

struct OrderView: View {
    var categories = StoredData.categories
    var menuItems = StoredData.menuItems
    
    @State private var cartItems: [MenuItem] = []
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
                            CategoryRowView(imageName: item.imageName, name: item.id)
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
                
                List(menuItems) { item in
                    ListRowView(menuItem: item)
                        .onTapGesture {
                            toggleCartItem(item)
                        }
                    
                }
            }
            .navigationBarItems(trailing: CartView(cartItems: cartItems.count))
        }
    }
    
    private func toggleCartItem(_ menuItem: MenuItem) {
        cartItems.append(menuItem)
    }
}



struct ListRowView: View {
    var menuItem: MenuItem
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
                        ButtonView(menuItem: menuItem)
                    } else {
                        StepperView()
                    }
                    
                }
            }
        }
    }
}

struct ButtonView: View {
    @State var menuItem: MenuItem
    var body: some View {
        Button(action: {}, label: {
            Text("Add to Cart")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.regular)
                .padding(4.0)
                .onTapGesture {
                    print("This code has been performed",
                          menuItem.addedToCart)
                    menuItem.addedToCart = true
                    print(menuItem.addedToCart)
                }
        })
        .background(Color.red)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 7, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
    
}

struct StepperView: View {
    @State private var amount = 1
    var body: some View {
        Stepper("\(amount)", onIncrement: {
            amount += 1
        }, onDecrement: {
            if amount > 0 {
                amount -= 1
            } else {}
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
        
    }
}
