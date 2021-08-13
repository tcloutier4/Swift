//
//  MealCategoryResponse.swift
//  CourseProject
//
//  Created by user196933 on 8/12/21.
//

import Foundation

struct MealCategoryResponse : Codable{
    var categories: [Category]
}

struct Category : Codable{
   // var idCategory: String
    var strCategory: String
   // var strCategoryThumb: String
   // var strCategoryDescription: String
}
