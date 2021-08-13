//
//  TheMealDbApi.swift
//  CourseProject
//
//  Created by user196933 on 8/11/21.
//

import Foundation

struct TheMealDbApi{
    
    static let baseUrlString = "https://www.themealdb.com/api/json/v1/1/"
    
    static func listAllMeals(forCompletionHandler completionHandler: @escaping (MealResponse) -> Void){
        
        for i in 97...122{
            let alphabet: String = String(UnicodeScalar(i)!)
            
        let allMealsString = baseUrlString + "search.php?f=" + alphabet
        guard let allMealsURL = URL(string: allMealsString) else{
            return
        }
        var allMealsGetRequest = URLRequest(url: allMealsURL)
        allMealsGetRequest.httpMethod = "GET"
        
        let allMealsTask = URLSession.shared.dataTask(with: allMealsGetRequest){
            data, response, error in
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200, let data = data {
                    if let responseJson = try? JSONDecoder().decode(MealResponse.self, from: data){
                        OperationQueue.main.addOperation {
                        
                            completionHandler(responseJson)
                        }
                    }
                }
            }
        }
        
        allMealsTask.resume()
    }
    }
    
    static func listAllMealCategories(forCompletionHandler completionHandler: @escaping (MealCategoryResponse) -> Void){
        
        let allMealCategoriesString = baseUrlString + "categories.php"
        guard let allMealCategoriesURL = URL(string: allMealCategoriesString) else{
            return
        }
        var allMealCategoriesGetRequest = URLRequest(url: allMealCategoriesURL)
        allMealCategoriesGetRequest.httpMethod = "GET"
        
        let allMealCategoriesTask = URLSession.shared.dataTask(with: allMealCategoriesGetRequest){
            data, response, error in
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200, let data = data {
                    if let responseJson = try? JSONDecoder().decode(MealCategoryResponse.self, from: data){
                        OperationQueue.main.addOperation {
                        
                            completionHandler(responseJson)
                        }
                    }
                }
            }
        }
        
        allMealCategoriesTask.resume()
    }
    
    static func searchMealByName(mealName: String,forCompletionHandler completionHandler: @escaping (MealResponse) -> Void){


        let mealName = mealName.replacingOccurrences(of: " ", with: "%20")

        let mealByNameString = baseUrlString + "search.php?s=" + mealName
        guard let mealByNameURL = URL(string: mealByNameString) else{
            print("didn't find url")
            return
        }
        
        var mealByNameGetRequest = URLRequest(url: mealByNameURL)
        mealByNameGetRequest.httpMethod = "GET"
        
        let mealByNameTask = URLSession.shared.dataTask(with: mealByNameGetRequest){
            data, response, error in
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200, let data = data {
                    if let responseJson = try? JSONDecoder().decode(MealResponse.self, from: data){
                        OperationQueue.main.addOperation {
                        
                            completionHandler(responseJson)
                        }
                    }
                }
            }
        }
        
        mealByNameTask.resume()
    }
}

