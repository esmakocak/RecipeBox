import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var recipesVM: RecipesViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isEditing = false
    @State private var showingDeleteConfirmation = false

    var body: some View {
        ScrollView {
            Group {
                if let image = UIImage.fromBase64(recipe.image) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                }
                
                else if let image = UIImage(named: recipe.image) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                }
                
                else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .clipped()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom)
            )
            .overlay(
                LinearGradient(stops: [
                    Gradient.Stop(color: .clear, location: 0.8),
                    Gradient.Stop(color: Color(hue: 0.696, saturation: 0.023, brightness: 0.151), location: 1)
                ], startPoint: .top, endPoint: .bottom)
            )
            
            
            VStack (alignment: .leading, spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .frame(alignment: .leading)
                    .foregroundColor(Color("AccentColor"))
                
                VStack (alignment: .leading, spacing: 30) {
                    if !recipe.description.isEmpty {
                        Text(recipe.description)
                    }
                    
                    if !recipe.ingredients.isEmpty {
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
                    
                    if !recipe.directions.isEmpty {
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
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                     Image(systemName: "arrowshape.turn.up.backward.fill")
                }
            }
            
            // implement "add" favorites feature
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 20))
                    .foregroundColor( Color("AccentColor"))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            recipesVM.toggleFavorite(for: recipe)
                        }
                    }
            }
            
            ToolbarItem(placement: .secondaryAction) {
                Button(action: {
                    isEditing = true
                }) {
                    Text("Edit")
                    Image(systemName: "pencil.line")
                }
            }
            
            ToolbarItem(placement: .secondaryAction) {
                Button(action: {
                    showingDeleteConfirmation = true
                }) {
                    Text("Delete")
                    Image(systemName: "trash")
                }
            }
            
            
        }
        
        // Uyarı (Alert) kodu burada
        .alert(isPresented: $showingDeleteConfirmation) {
            Alert(
                title: Text("Do you want to delete this recipe?"),
                message: Text("This recipe will be permanently deleted."),
                primaryButton: .destructive(Text("Delete")) {
                    // Tarif silme işlemi
                    recipesVM.deleteRecipe(recipeId: recipe.id)
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel()
            )
        }
        .sheet(isPresented: $isEditing) {
            EditRecipeView(recipe: Binding(
                get: { recipe },
                set: { updatedRecipe in
                    if let index = recipesVM.recipes.firstIndex(where: { $0.id == recipe.id }) {
                        recipesVM.recipes[index] = updatedRecipe
                    }
                }
            ))
            .environmentObject(recipesVM)
        }
    }
}

#Preview {
    RecipeView(recipe: Recipe.all[2])
        .environmentObject(RecipesViewModel())
}
