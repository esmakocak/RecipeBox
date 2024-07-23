//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct CategoriesView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(Category.allCases) { category in
                        NavigationLink(destination: CategoryView(category: category)) {
                            CategoryCard(category: category)
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    CategoriesView()
}


