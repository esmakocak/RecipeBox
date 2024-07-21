//
//  HomeView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(Recipe.all) { recipe in
                Text(recipe.name)
                    .navigationTitle("My Recipes")
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
}
