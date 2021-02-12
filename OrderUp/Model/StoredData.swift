//
//  MenuItemsAndCategories.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import Foundation
import SwiftUI

struct StoredData {
    static var categories = [Category(id: "Pizza", imageName: "Pizza5"),Category(id: "Chinese", imageName: "chinesefood"),Category(id: "Salads", imageName: "salads"),Category(id: "Desserts", imageName: "desserts")]
    static var menuItems = [MenuItem(id: "Pepperoni Pizza", description: "The way all pizza should be, New York style.", price: 14.99, addedToCart: false, image: "Pizza1"),MenuItem(id: "Garden Pizza", description: "Healthy with fresh ingredients.", price: 14.99, addedToCart: false, image: "Pizza2"),MenuItem(id: "Supreme Pizza", description: "The adult pizza. How many kids like supreme pizza?", price: 14.99, addedToCart: false, image: "Pizza4"),MenuItem(id: "Margharita Pizza", description: "So basic yet so good.", price: 14.99, addedToCart: false, image: "Pizza3")]
}
