//
//  StoreManager.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/25/21.
//

import Foundation

class MenuManager {
    static let instance = MenuManager()
    
    var storedData = StoredData()
    
    var cart = Cart()
}
