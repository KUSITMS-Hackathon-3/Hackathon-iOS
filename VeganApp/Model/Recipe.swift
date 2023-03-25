//
//  Recipe.swift
//  VeganApp
//
//  Created by 정태우 on 2023/03/25.
//

import Foundation
struct Recipe {
    var id: String?
    var title: String
    var ingredients: [String]
    var veganLevel: String
    var steps: [String]
    var createdDate: Date?
    var recipeImageUrl: String
    var hashtag: String
    
}
