//
//  Favorites.swift
//  CourseProject
//
//  Created by user196933 on 8/12/21.
//

import Foundation

class FavoritesDataManager{
    
    private let dataFileName = "FavoriteMealList"
    
    private var sandboxURL: URL{
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.first!.appendingPathComponent(dataFileName)
    }
    
    var favorites:[Meal] = []
    
    func add(_ newFavorite: Meal){
       
        let mealID = favorites.contains { $0.idMeal == newFavorite.idMeal}
        if !mealID{
            favorites.append(newFavorite)
            save()

        }
     
        save()
    }
    
    func delete( at index: Int){
        favorites.remove(at: index)	
        save()
    }
    
    func save() -> Bool{
        var arrayDict = [[String: AnyObject]]()
        for currentFavorite in favorites{
            var dict = [String: AnyObject]()
            dict["idMeal"] = currentFavorite.idMeal as AnyObject
            dict["strMeal"] = currentFavorite.strMeal as AnyObject
            dict["strCategory"] = currentFavorite.strCategory as AnyObject
            dict["strMealThumb"] = currentFavorite.strMealThumb as AnyObject
            arrayDict.append(dict)
            
           
        }
        print("currentFavorite \(arrayDict)")
        return (arrayDict as NSArray).write(to: sandboxURL, atomically: true)
    }

//    func readFromFile() {
//        favorites.removeAll()
//        guard let plistArray = NSArray(contentsOf: sandboxURL),
//              let arrayDict = plistArray as? [[String: AnyObject]]
//        else { return }
//
//        for currentDict in arrayDict {
//            var newFavorite: Meal!
//
//            newFavorite.idMeal = currentDict["idMeal"] as! String
//            newFavorite.strMeal = currentDict["strMeal"] as! String
//            newFavorite.strCategory = currentDict["strCategory"] as! String
//            newFavorite.strMealThumb = currentDict["strMealThumb"] as! String
//            favorites.append(newFavorite)
//        }
//    }
    
    init() {
        
        let sandboxPath = sandboxURL.path
        if !FileManager.default.fileExists(atPath: sandboxPath){
            guard let bundlePath = Bundle.main.path(forResource: dataFileName, ofType: "plist")
            else{ return }
            do{
                try FileManager.default.copyItem(atPath: bundlePath, toPath: sandboxPath)
                print("Successfully copied data file from bundle to sandbox")
                
            }
            catch{
                print("Error copying file \(error)")
            }
        }
        //readFromFile()
    }
}

    
    
    //var idMeal : String
    //var strMeal : String
    //var strCategory : String
    //var strMealThumb : String

