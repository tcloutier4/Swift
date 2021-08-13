//
//  GroceryListViewController.swift
//  CourseProject
//
//  Created by user196933 on 8/6/21.
//

import UIKit

class GroceryListViewController: UIViewController {

    var dataManager = SelectedRecipeCoreDataManager()
    
    @IBOutlet weak var groceryTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let recipeList = dataManager.fetchAllSelectedRecipes()
        print(recipeList)
        
        print(recipeList.count)
        
        for i in stride(from: 0, through: recipeList.count-1, by: 1){
            
            let currentName = recipeList[i].mealName
            print(currentName)
            TheMealDbApi.searchMealByName(mealName: currentName!) { currentMealResponse in

                
                for currentMeal in currentMealResponse.meals{
                    
                    var ingredients: [String] = []
                    var measurements: [String] = []
                    var ingredientlist: String = ""
                    

                    
                    ingredients.append(currentMeal.strIngredient1)
                    if !currentMeal.strIngredient2.isEmpty {ingredients.append(currentMeal.strIngredient2)}
                    if !currentMeal.strIngredient3.isEmpty {ingredients.append(currentMeal.strIngredient3)}
                    if !currentMeal.strIngredient4.isEmpty {ingredients.append(currentMeal.strIngredient4)}
                    if !currentMeal.strIngredient5.isEmpty {ingredients.append(currentMeal.strIngredient5)}
                    if !currentMeal.strIngredient6.isEmpty {ingredients.append(currentMeal.strIngredient6)}
                    if !currentMeal.strIngredient7.isEmpty {ingredients.append(currentMeal.strIngredient7)}
                    if !currentMeal.strIngredient8.isEmpty {ingredients.append(currentMeal.strIngredient8)}
                    if !currentMeal.strIngredient9.isEmpty {ingredients.append(currentMeal.strIngredient9)}
                    if !currentMeal.strIngredient10.isEmpty {ingredients.append(currentMeal.strIngredient10)}
                    if !currentMeal.strIngredient11.isEmpty {ingredients.append(currentMeal.strIngredient11)}
                    if !currentMeal.strIngredient12.isEmpty {ingredients.append(currentMeal.strIngredient12)}
                    if !currentMeal.strIngredient13.isEmpty {ingredients.append(currentMeal.strIngredient13)}
                    if !currentMeal.strIngredient14.isEmpty {ingredients.append(currentMeal.strIngredient14)}
                    if !currentMeal.strIngredient15.isEmpty {ingredients.append(currentMeal.strIngredient15)}
                    if !currentMeal.strIngredient16.isEmpty {ingredients.append(currentMeal.strIngredient16)}
                    if !currentMeal.strIngredient17.isEmpty {ingredients.append(currentMeal.strIngredient17)}
                    if !currentMeal.strIngredient18.isEmpty {ingredients.append(currentMeal.strIngredient18)}
                    if !currentMeal.strIngredient19.isEmpty {ingredients.append(currentMeal.strIngredient19)}
                    if !currentMeal.strIngredient20.isEmpty {ingredients.append(currentMeal.strIngredient20)}
                    
                    measurements.append(currentMeal.strMeasure1)
                    if !currentMeal.strMeasure2.isEmpty {measurements.append(currentMeal.strMeasure2)}
                    if !currentMeal.strMeasure3.isEmpty {measurements.append(currentMeal.strMeasure3)}
                    if !currentMeal.strMeasure4.isEmpty {measurements.append(currentMeal.strMeasure4)}
                    if !currentMeal.strMeasure5.isEmpty {measurements.append(currentMeal.strMeasure5)}
                    if !currentMeal.strMeasure6.isEmpty {measurements.append(currentMeal.strMeasure6)}
                    if !currentMeal.strMeasure7.isEmpty {measurements.append(currentMeal.strMeasure7)}
                    if !currentMeal.strMeasure8.isEmpty {measurements.append(currentMeal.strMeasure8)}
                    if !currentMeal.strMeasure9.isEmpty {measurements.append(currentMeal.strMeasure9)}
                    if !currentMeal.strMeasure10.isEmpty {measurements.append(currentMeal.strMeasure10)}
                    if !currentMeal.strMeasure11.isEmpty {measurements.append(currentMeal.strMeasure11)}
                    if !currentMeal.strMeasure12.isEmpty {measurements.append(currentMeal.strMeasure12)}
                    if !currentMeal.strMeasure13.isEmpty {measurements.append(currentMeal.strMeasure13)}
                    if !currentMeal.strMeasure14.isEmpty {measurements.append(currentMeal.strMeasure14)}
                    if !currentMeal.strMeasure15.isEmpty {measurements.append(currentMeal.strMeasure15)}
                    if !currentMeal.strMeasure16.isEmpty {measurements.append(currentMeal.strMeasure16)}
                    if !currentMeal.strMeasure17.isEmpty {measurements.append(currentMeal.strMeasure17)}
                    if !currentMeal.strMeasure18.isEmpty {measurements.append(currentMeal.strMeasure18)}
                    if !currentMeal.strMeasure19.isEmpty {measurements.append(currentMeal.strMeasure19)}
                    if !currentMeal.strMeasure20.isEmpty {measurements.append(currentMeal.strMeasure20)}
                            
                            
                            for i in stride(from: 0, through: ingredients.count-1, by: 1){
                       
                               
                                    ingredientlist.append(ingredients[i] + "    ")
                                    ingredientlist.append(measurements[i] + "\n")
                        
                            
                            }
                    self.groceryTextView.text.append(ingredientlist)

                    

                        }

                    }

      
                    
                   
            
        
                    
                }}}
            
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


