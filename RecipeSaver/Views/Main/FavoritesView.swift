//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel

    var body: some View {
        NavigationView {
            if recipesVM.favorites.isEmpty {
                Text("You haven't saved any recipe to your favorites yet.")
                    .padding()
                    .navigationTitle("Favorites")
            } else {
                ScrollView {
                    RecipeList(recipes: recipesVM.favorites)
                }
                .navigationTitle("Favorites")
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(RecipesViewModel())
}
