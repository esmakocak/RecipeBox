//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 23.07.2024.

import SwiftUI
import PhotosUI

struct AddRecipeView: View {
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var recipeImage: UIImage?
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigationToRecipe = false

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Photo")) {
                    PhotosPicker(selection: $photosPickerItem, matching: .images) {
                        HStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.accentColor)
                            Text("Upload a photo")
                        }
                    }
                }
                
                // Resmi görüntüleme bölümü
                if let image = recipeImage {
                    Section(header: Text("Selected Photo")) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(width: 200, height: 200) // İsteğe bağlı olarak boyutu ayarlayın
                    }
                }
                
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
                
            }
            .onChange(of: photosPickerItem) { newItem in
                if let photosPickerItem = newItem {
                    Task {
                        if let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                recipeImage = image
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    NavigationLink(
                        destination: Group {
                            if let latestRecipe = recipesVM.recipes.last {
                                RecipeView(recipe: latestRecipe)
                            } else {
                                Text("No recipes available")
                            }
                        },
                        isActive: $navigationToRecipe
                    ) {
                        Button {
                            saveRecipe()
                            navigationToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    AddRecipeView()
        .environmentObject(RecipesViewModel())
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormatter.string(from: now)
        
        let base64Image = recipeImage?.toBase64() ?? ""
        
        let recipe = Recipe(
            name: name,
            image: base64Image,
            description: description,
            ingredients: ingredients,
            directions: directions,
            category: selectedCategory.rawValue,
            datePublished: datePublished,
            url: ""
        )
        
        recipesVM.addRecipe(recipe: recipe)
        
        // En son eklenen tarifi navigasyona geçmek için ayarla
        navigationToRecipe = true
    }
}
