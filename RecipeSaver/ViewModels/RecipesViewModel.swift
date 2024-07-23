//
//  RecipesViewModel.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 23.07.2024.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Recipe].self, from: data)
        else {return}
        
        self.recipes = savedItems
    }
    
    
    func deleteRecipe(recipeId: UUID) {
        recipes.removeAll { $0.id == recipeId }
    }
    
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
    
}
