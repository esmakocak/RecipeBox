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
            name: "Strawberry Smoothie",
            image: "smoothie",
            description: "A refreshing and healthy smoothie.",
            ingredients: """
              1 cup frozen strawberries\n
              ½ cup milk (dairy or plant-based)\n
              ½ cup yogurt (plain or vanilla)\n
              1 tablespoon honey or maple syrup (optional)\n
              """,
            directions: """
              Combine all ingredients in a blender. \n
              Blend until smooth.
              """,
            category: "Drink",
            datePublished: "2023-04-10",
            url: "",
            isFavorite: false
        )
        
        let sampleRecipe2 = Recipe(
              name: "Chocolate Tiramisu",
              image: "tiramisu",
              description: "A luscious Italian dessert with coffee-soaked ladyfingers and creamy mascarpone.",
              ingredients: """
                24 savoiardi ladyfingers (Italian sponge biscuits)\n
                1 ½ cups strong brewed coffee, cooled\n
                8 ounces mascarpone cheese\n
                ½ cup granulated sugar\n
                2 large eggs, separated\n
                1 tablespoon dark rum or brandy (optional)\n
                Cocoa powder for dusting
                """,
              directions: """
                In a shallow dish, combine coffee and rum (if using). \n
                Quickly dip each ladyfinger in the coffee mixture, turning once to coat both sides.. \n
                In a large bowl, beat mascarpone and sugar until smooth. \n
                In a separate bowl, beat egg yolks until pale and thick. Stir into mascarpone mixture. \n
                In a clean bowl, beat egg whites until stiff peaks form. Gently fold into the mascarpone mixture. \n
                Spread half the mascarpone mixture over the ladyfingers. \n
                Repeat with remaining ladyfingers and mascarpone mixture. \n
                Dust the top with cocoa powder. \n
                Refrigerate for at least 4 hours, or preferably overnight, before serving.
                """,
              category: "Dessert",
              datePublished: "2020-08-01",
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
    
    func updateItem() {
        
    }
    
    func toggleFavorite(for recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index].isFavorite.toggle()
        }
    }
    
    var favorites: [Recipe] {
           recipes.filter { $0.isFavorite }
    }
    
    
    func updateRecipe(updatedRecipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == updatedRecipe.id }) {
            recipes[index] = updatedRecipe
        }
    }
    
}
