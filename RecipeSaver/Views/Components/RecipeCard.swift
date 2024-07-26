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
            Group {
                if let image = UIImage.fromBase64(recipe.image) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(width: 160, height: 217)
            .clipped()
            .overlay(alignment: .bottomLeading) {
                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.5))
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 10)
    }
}

#Preview {
    RecipeCard(recipe: Recipe.all[2])
}
