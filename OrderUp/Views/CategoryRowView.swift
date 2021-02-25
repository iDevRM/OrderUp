//
//  CategoryRowView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import SwiftUI

struct CategoryRowView: View {
    var category: Category
    
    @ObservedObject var selectedCategory = MenuManager.instance.storedData
    
    var body: some View {
        VStack {
            Button(action: {selectedCategory.setItems(category: category.id)}, label: {
                Image("\(category.imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 150,maxHeight: 150)
                    .cornerRadius(15)
                    .shadow(radius: 10)
            })
            Text("\(category.id)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .offset( y: 0)
                
        }
    }
}


