//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("You haven't save any recipe to your favorites yet.")
                .padding()
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
