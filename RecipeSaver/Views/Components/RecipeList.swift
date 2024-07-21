//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 21.07.2024.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    
    var body: some View {
            
            VStack{
                HStack {
                    Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                        .font(.headline)
                        .fontWeight(.medium)
                    .opacity(0.7)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(recipes) { recipe in
                        RecipeCard(recipe: recipe)
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal)
    }
}

#Preview {
    ScrollView{
        RecipeList(recipes: Recipe.all)
    }
}
