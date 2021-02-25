//
//  MenuItemsAndCategories.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import Combine

class StoredData: ObservableObject {
    
    
    var objectWillChange = ObservableObjectPublisher()
    
    var items: [MenuItem] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        items = pizzaItems
    }
    
    var categories = [Category(id: "Pizza", imageName: "Pizza5"),Category(id: "Chinese", imageName: "chinesefood"),Category(id: "Salads", imageName: "salads"),Category(id: "Desserts", imageName: "desserts")]
    
    var pizzaItems = [MenuItem(id: "Pepperoni Pizza", description: "The way all pizza should be, New York style.", price: 14.99, addedToCart: false, image: "Pizza1"),MenuItem(id: "Garden Pizza", description: "Healthy with fresh ingredients.", price: 14.99, addedToCart: false, image: "Pizza2"),MenuItem(id: "Supreme Pizza", description: "The adult pizza. How many kids like supreme pizza?", price: 14.99, addedToCart: false, image: "Pizza4"),MenuItem(id: "Margharita Pizza", description: "So basic yet so good.", price: 14.99, addedToCart: false, image: "Pizza3")]
    
    var chineseItems = [MenuItem(id: "Orange Chicken", description: "Sweet and Spicy.", price: 7.99, addedToCart: false, image: "orangechicken")]
    
    var saladItems = [MenuItem(id: "Greek Salad", description: "The best mediterranean salad in town", price: 7.99, addedToCart: false, image: "greekSalad" )]
    
    var dessertItems = [MenuItem(id: "Rocky Road Ice Cream", description: "Chocolate Ice Cream with fudge, almonds and marshmellows", price: 4.99, addedToCart: false, image: "rockyroad")]
    
    func setItems(category: String) {
        switch category {
        case "Pizza":
            items = pizzaItems
        case "Chinese":
            items = chineseItems
        case "Salads":
            items = saladItems
        case "Desserts":
            items = dessertItems
        default:
            break
        }
    }
}
