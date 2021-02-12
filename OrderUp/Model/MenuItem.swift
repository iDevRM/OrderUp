//
//  MenuItem.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import Foundation

struct MenuItem: Identifiable {
    var id: String
    var description: String
    var price: Double
    var addedToCart: Bool
    var image: String
}
