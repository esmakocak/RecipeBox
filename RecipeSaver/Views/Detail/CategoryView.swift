//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 23.07.2024.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all.filter{ $0.category == category.rawValue })
        }
        .navigationTitle(category.rawValue + "s")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                     Image(systemName: "arrowshape.turn.up.backward.fill")
                }
            }
        }
    }
}

#Preview {
    CategoryView(category: Category.dessert)
}
