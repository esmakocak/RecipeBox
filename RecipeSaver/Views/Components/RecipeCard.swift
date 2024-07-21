//
//  RecipeCard.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 21.07.2024.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 15, x:0, y:10)
        
    }
}

#Preview {
    RecipeCard(recipe: Recipe.all[1])
}
