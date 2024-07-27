//
//  EditRecipeView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 27.07.2024.
//

import SwiftUI

struct EditRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    @Binding var recipe: Recipe
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String
    @State private var description: String
    @State private var ingredients: String
    @State private var directions: String

    init(recipe: Binding<Recipe>) {
        self._recipe = recipe
        self._name = State(initialValue: recipe.wrappedValue.name)
        self._description = State(initialValue: recipe.wrappedValue.description)
        self._ingredients = State(initialValue: recipe.wrappedValue.ingredients)
        self._directions = State(initialValue: recipe.wrappedValue.directions)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }

                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(minHeight: 50)
                }

                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                        .frame(minHeight: 100)
                }

                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                        .frame(minHeight: 200)
                }
            }
            .navigationTitle("Edit Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                },
                trailing: Button(action: {
                    saveRecipe()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "checkmark")
                }
            )
            
        }
        
    }

    private func saveRecipe() {
        let updatedRecipe = recipe.update(name: name, description: description, ingredients: ingredients, directions: directions)
        recipesVM.updateRecipe(updatedRecipe: updatedRecipe)
    }
}
