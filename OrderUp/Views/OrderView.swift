//
//  ContentView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/11/21.
//

import SwiftUI

struct OrderView: View {
    var categories = [Category(id: "Pizza", imageName: "Pizza5"),Category(id: "Chinese", imageName: "chinesefood"),Category(id: "Salads", imageName: "salads"),Category(id: "Desserts", imageName: "desserts")]
    var menuItems = [MenuItem(id: "Pepperoni Pizza", description: "The way all pizza should be, New York style.", price: 14.99, addedToCart: false, image: "Pizza1"),MenuItem(id: "Garden Pizza", description: "Healthy with fresh ingredients.", price: 14.99, addedToCart: false, image: "Pizza2"),MenuItem(id: "Supreme Pizza", description: "The adult pizza. How many kids like supreme pizza?", price: 14.99, addedToCart: false, image: "Pizza4"),MenuItem(id: "Margharita Pizza", description: "So basic yet so good.", price: 14.99, addedToCart: false, image: "Pizza3")]
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
            .navigationBarItems(trailing: Cart(cartItems: cartItems.count)
)
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
                    Button(action: {}, label: {
                        Text("Add to Cart")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.regular)
                            .padding(4.0)
                            .onTapGesture {
                                
                            }
                    })
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 7, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                  
                }
            }
        }
    }
}

struct Cart: View {
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

struct CategoryRowView: View {
    let imageName: String
    let name: String
    var body: some View {
        VStack {
            Image("\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 150,maxHeight: 150)
                .cornerRadius(15)
                .shadow(radius: 10)
            Text("\(name)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .offset( y: 0)
                
        }
    }
}

struct Category: Identifiable {
    var id: String
    var imageName: String
    
}

struct MenuItem: Identifiable {
    var id: String
    var description: String
    var price: Double
    var addedToCart: Bool
    var image: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
        
    }
}
