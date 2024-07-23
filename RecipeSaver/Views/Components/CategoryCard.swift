//
//  CategoryCard.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 22.07.2024.
//

import SwiftUI

struct CategoryCard: View {
    var category: Category
    
    var body: some View {
        VStack{
            HStack {
                Image(category.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 200, alignment: .center)
                    .clipped()
                    .padding()
                    .padding(.bottom, 10)
                Text(category.rawValue + "s")
                    .font(.headline)
                Spacer()
            }
            
            
        }
        .frame(width: 350, height: 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 3)
    }
}


#Preview {
    CategoryCard(category: Category.soup)
}
