//
//  ContentView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/11/21.
//

import SwiftUI

struct OrderView: View {
    var categories = [Category(id: "Pizza", imageName: "icons8-italian_pizza"),Category(id: "Chinese", imageName: "icons8-chinese_noodle"),Category(id: "Street Food", imageName: "icons8-street_food"),Category(id: "Desserts", imageName: "icons8-cherry_donut")]
    var menuItems = [MenuItem(id: "Pizza", description: "Yummy Pizza", price: 14.99, addedToCart: false, image: "clear")]
    //    @State private var cartItems: [CartItems]
    var body: some View {
        NavigationView {
            VStack {
                Text("Categories")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .offset(x: -150)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 55) {
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
                }
            }
        }
    }
}

struct ListRowView: View {
    var menuItem: MenuItem
    var body: some View {
        HStack {
            Image(systemName: "\(menuItem.image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)
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
                            
                            
                    }).background(Color.red)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 7, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    
                    
                    
                }
            }
        }
    }
}

struct Cart: View {
//    var cartItems: Int
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(maxWidth: 22)
                Text("2")
                    .foregroundColor(.white)
            }
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
            Text("\(name)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .offset( y: -10)
                
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
