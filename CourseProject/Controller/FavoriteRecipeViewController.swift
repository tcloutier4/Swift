//
//  FavoriteRecipeViewController.swift
//  CourseProject
//
//  Created by user196933 on 8/6/21.
//

import UIKit

class FavoriteRecipeViewController: UIViewController {
    
    var sortedMealArray: [Meal] = []
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    let dataManager = FavoriteCoreDataManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteTableView.dataSource = self
        //favoriteTableView.delegate = self
        // Do any additional setup after loading the view.
        
        favoriteTableView.reloadData()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favOneRecipe"{
            if let oneMealVC = segue.destination as? OneRecipeViewController,
               let selectedIndexPath = favoriteTableView.indexPathForSelectedRow{
                let currentMeal = favoriteTableView.cellForRow(at: selectedIndexPath) as! MealTableViewCell
                oneMealVC.selectedMealName = currentMeal.mealNameLabel.text
            }
            
            
                
            }
        }
        
    }



extension FavoriteRecipeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell
        
        let currentFavorite = dataManager.favorites[indexPath.row]
        cell.mealNameLabel.text = currentFavorite.mealName
        cell.categoryLabel.text = currentFavorite.mealCategory
        cell.imageView?.load(urlString: currentFavorite.mealThumb!)
        
        return cell
    }
    
    
}
//
//extension FavoriteRecipeViewController : UITableViewDelegate{
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}


