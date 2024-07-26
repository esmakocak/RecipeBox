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
        if recipes.isEmpty {
            loadSampleRecipes() // Test amaçlı
        }
    }

    func loadSampleRecipes() {
        let sampleRecipe1 = Recipe(
            name: "Sample Recipe 1",
            image: "",
            description: "This is a sample recipe description for Recipe 1.",
            ingredients: "Flour, Sugar, Eggs, Butter",
            directions: "Mix ingredients and bake.",
            category: "Dessert",
            datePublished: "2024-07-25",
            url: "",
            isFavorite: false
        )
        
        let sampleRecipe2 = Recipe(
            name: "Sample Recipe 2",
            image: "",
            description: "This is a sample recipe description for Recipe 2.",
            ingredients: "Chicken, Salt, Pepper, Olive Oil",
            directions: "Season chicken and cook in a pan.",
            category: "Main",
            datePublished: "2024-07-25",
            url: "",
            isFavorite: false
        )
        
        recipes = [sampleRecipe1, sampleRecipe2]
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
    
    func toggleFavorite(for recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index].isFavorite.toggle()
        }
    }
    
    var favorites: [Recipe] {
           recipes.filter { $0.isFavorite }
    }
    
    
}
