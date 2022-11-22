//
//  Recipe_List_AppApp.swift
//  Recipe List App
//
//  Created by ed on 11/19/22.
//

import SwiftUI

@main
struct Recipe_List_AppApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
        
    }
}
