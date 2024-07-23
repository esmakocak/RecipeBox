//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 22.07.2024.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .overlay {
                        LinearGradient(stops:[ Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: Color(hue: 0.696, saturation: 0.023, brightness: 0.151), location: 1)], startPoint: .top, endPoint: .bottom)
                    }
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300, alignment: .center)
            .clipped()
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
            
            VStack (alignment: .leading, spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .frame(alignment: .leading)
                    .foregroundColor(Color("AccentColor"))
                
                VStack (alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty{
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty{
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Ingredients")
                                .font(.headline)
                                .foregroundColor(Color("AccentColor"))
                            
                            ForEach(recipe.ingredients.split(separator: "\n"), id: \.self) { ingredient in
                                Text("• \(String(ingredient))")
                                    .font(.body)
                            }
                        }
                    }
                    
                    if !recipe.directions.isEmpty{
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Directions")
                                .font(.headline)
                                .foregroundColor(Color("AccentColor"))
                            
                            ForEach(recipe.directions.split(separator: "\n"), id: \.self) { directions in
                                Text("➔ \(String(directions))")
                                    .font(.body)
                            }
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}

#Preview {
    RecipeView(recipe: Recipe.all[7])
}





