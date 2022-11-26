//
//  FeatureView.swift
//  Recipe List App
//
//  Created by ed on 11/22/22.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
   
    var body: some View {
         
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            
            GeometryReader { geo in
                
                TabView (selection: $tabSelectionIndex){
                    
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured == true {
                            
                            //Recipe card Button
                            Button {
                                //show the recipe detail sheet
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .frame(width: 160)
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                            
                        }
                    }
                }
                
                // Recipe card
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            
            
            VStack (alignment: .leading, spacing: 10) {
                
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .frame(width: 160)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    func setFeaturedIndex() {
       // Find first index of recipe that is featured
        var index = model.recipes.index { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
