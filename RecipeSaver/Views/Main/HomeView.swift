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
            Text("My Recipes")
                .navigationTitle("My Recipes")
        }
    }
}

#Preview {
    HomeView()
}
