//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by ed on 11/19/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .padding(.bottom, 5)
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("•" + item)
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
                // MARK: Divider
                Divider()
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + "." + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
        
    }
    
    
    struct RecipeDetailView_Previews: PreviewProvider {
        static var previews: some View {
            //Create a dummy recipe and pass it into the detail view so that we can see a preview
            let model = RecipeModel()
            RecipeDetailView(recipe: model.recipes[0])
        }
    }
}