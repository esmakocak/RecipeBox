//
//  RecipesViewModel.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 23.07.2024.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
    
}
