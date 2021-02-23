//
//  CategoryRowView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import SwiftUI

struct CategoryRowView: View {
    @State var category: Category
    @EnvironmentObject var storedData: StoredData
    
    var body: some View {
        VStack {
            Button(action: {}, label: {
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


