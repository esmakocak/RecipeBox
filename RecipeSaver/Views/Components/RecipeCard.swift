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
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
        } placeholder: {
            Image(systemName: "photo")
        }
    }
}

#Preview {
    RecipeCard(recipe: Recipe.all[2])
}
