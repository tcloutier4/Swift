//
//  OneRecipeViewController.swift
//  CourseProject
//
//  Created by user196933 on 8/6/21.
//

import UIKit

class OneRecipeViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var ingredientsListLabel: UILabel!
    
    @IBOutlet weak var instructionsListLabel: UILabel!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var measurementLabel: UILabel!
    
    
    @IBOutlet weak var ingredientLabel2: UILabel!
    
    
    @IBOutlet weak var measurementLabel2: UILabel!
    
    
    
    var selectedMealName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ingredient1: String = ""
        var ingredient2: String = ""
        var measurement1: String = ""
        var measurement2: String = ""
        var ingredients = [String]()
        var measurements = [String]()
        
        
        TheMealDbApi.searchMealByName(mealName: selectedMealName!) { currentMealResponse in

            for currentMeal in currentMealResponse.meals{
             
                self.mealImageView.load(urlString: currentMeal.strMealThumb)
                
                for i in stride(from: 1, to: 21, by: 1){
                    ingredients.append("strIngredient\(i)")
                    measurements.append("strMeasure\(i)")
                }
                print(ingredients)
                print(measurements[1])
                
                for i in stride(from: 1, to: 21, by: 1){
                    if i%2 == 0{

                    }
                    else{
                        ingredient1 = ingredient1 + currentMeal.strIngredient1

                        measurement1 = measurement1 +currentMeal.strMeasure1
                    }
                }
                self.dataManager.delete(at: currentMeal.idMeal)
                
            }
        }
        
        mealNameLabel.text = selectedMealName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
