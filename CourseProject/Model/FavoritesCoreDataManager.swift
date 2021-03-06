//
//  FavoritesCoreDataManager.swift
//  CourseProject
//
//  Created by user196933 on 8/12/21.
//

import Foundation
import CoreData

class FavoriteCoreDataManager{
    
    
    
    var selectedRecipes:[SelectedRecipes] = []
    var favorites:[Favorites] = []
    
    func fetchAllFavorites() -> [Favorites]{
        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        guard let results = try? persistentContainer.viewContext.fetch(request)
        else{
            return[]
        }
        return results
    }
    
    func fetchOneFavorite(mealName: String) -> Int{
        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        guard let results = try? persistentContainer.viewContext.fetch(request)
        else{
            return -1
        }
        let index = results.count
        for i in stride(from: 0, through: index-1, by: 1){
            if results[i].mealName == mealName{
                return i
            }
            else {return -1}
        }
        return -1
    }
    
    init(){
        favorites = fetchAllFavorites()
    }
    
    func addFavorite(withMealID mealID: String,
                     withMealName mealName: String,
                     withMealCategory mealCategory: String,
                     withMealThumb mealThumb: String){
        let newFavorite = Favorites(context: persistentContainer.viewContext)
        newFavorite.mealID = mealID
        newFavorite.mealName = mealName
        newFavorite.mealCategory = mealCategory
        newFavorite.mealThumb = mealThumb
        saveContext()
        favorites = fetchAllFavorites()
        
    }
    
    func deleteFavorite(at index: Int){
        let currentFavorite = favorites[index]
        persistentContainer.viewContext.delete(currentFavorite)
        saveContext()
        favorites = fetchAllFavorites()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "RecipeModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {

        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
