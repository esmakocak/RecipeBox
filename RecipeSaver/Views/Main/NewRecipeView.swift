//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showAddRecipe = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                        
                            .foregroundColor(Color.white)
                        Text("Add New Recipe")
                            .font(.headline)
                            .foregroundColor(Color.white)
                    }
                    .padding(20)
                    .background(Color("AccentColor"))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.3), radius: 7, x: 3, y: 3)
                }
                .navigationTitle("New Recipe")
            } .padding(.bottom, 30)
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}

#Preview {
    NewRecipeView()
}
