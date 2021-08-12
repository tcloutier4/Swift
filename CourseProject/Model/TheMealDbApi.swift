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
        
        let allMealsString = baseUrlString + "search.php?f=a"
        guard let allMealsURL = URL(string: allMealsString) else{
            return
        }
        var allMealsGetRequest = URLRequest(url: allMealsURL)
        allMealsGetRequest.httpMethod = "GET"
        //allMealsGetRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
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
