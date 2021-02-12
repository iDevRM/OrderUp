//
//  CategoryRowView.swift
//  OrderUp
//
//  Created by Ricardo Martinez on 2/12/21.
//

import SwiftUI

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
