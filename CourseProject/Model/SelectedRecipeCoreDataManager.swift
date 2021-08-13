//
//  SelectedRecipeCoreDataManager.swift
//  CourseProject
//
//  Created by user196933 on 8/13/21.
//

import Foundation
import CoreData

class SelectedRecipeCoreDataManager{
    
    
    var selectedRecipes: [SelectedRecipes] = []
    func fetchAllSelectedRecipes() -> [SelectedRecipes]{
        let request: NSFetchRequest<SelectedRecipes> = SelectedRecipes.fetchRequest()
        guard let results = try? persistentContainer.viewContext.fetch(request)
        else{
            return[]
        }
        return results
    }


    init(){
        selectedRecipes = fetchAllSelectedRecipes()
    }

    func addSelectedRecipes(withMealID mealID: String,
                     withMealName mealName: String,
                     withMealCategory mealCategory: String,
                     withMealThumb mealThumb: String){
        let newSelectedRecipes = SelectedRecipes(context: persistentContainer.viewContext)
        newSelectedRecipes.mealID = mealID
        newSelectedRecipes.mealName = mealName
        newSelectedRecipes.mealCategory = mealCategory
        newSelectedRecipes.mealThumb = mealThumb
        saveContext()
        selectedRecipes = fetchAllSelectedRecipes()

    }

    func deleteSelectedRecipes(at index: Int){
        let currentSelectedRecipes = selectedRecipes[index]
        persistentContainer.viewContext.delete(currentSelectedRecipes)
        saveContext()
        selectedRecipes = fetchAllSelectedRecipes()
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
        print("in save")
        let context = persistentContainer.viewContext
        print(context)
        if context.hasChanges {
            do {
                print("in save do catch")
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
