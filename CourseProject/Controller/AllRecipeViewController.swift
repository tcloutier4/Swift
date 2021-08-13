//
//  AllRecipeViewController.swift
//  CourseProject
//
//  Created by user196933 on 8/6/21.
//

import UIKit

class AllRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mealTableView: UITableView!
    
    @IBOutlet weak var allRecipeSearchBar: UISearchBar!
    @IBOutlet weak var networkRequestIndicator:
        UIActivityIndicatorView!
   
    var mealArray: [Meal] = []
    var sortedMealArray: [Meal] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        networkRequestIndicator.startAnimating()
        // Do any additional setup after loading the view.
       

        TheMealDbApi.listAllMeals{ currentMealResponse in
            self.networkRequestIndicator.stopAnimating()
            self.networkRequestIndicator.isHidden = true
            
            for currentMeal in
                currentMealResponse.meals{

                
                self.mealArray.append(currentMeal)
                
                
            }
            
            self.sortedMealArray = self.mealArray.sorted{ $0.strMeal < $1.strMeal}
            
            
            self.mealTableView.dataSource = self
            self.mealTableView.delegate = self
            self.mealTableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMealArray.count
    }

    func tableView(_ tableView:UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell


        let meal = sortedMealArray[indexPath.row]
        
        cell.mealNameLabel.text = meal.strMeal
        cell.categoryLabel.text = meal.strCategory
        cell.mealImageView.load(urlString: meal.strMealThumb)
        
    
        return cell
    }
    




    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneRecipe"{
            if let oneMealVC = segue.destination as? OneRecipeViewController,
               let selectedIndexPath = mealTableView.indexPathForSelectedRow{
                let currentMeal = sortedMealArray[selectedIndexPath.row]
                oneMealVC.selectedMealName = currentMeal.strMeal
            }
            
            
                
            }
        }
        
    }
    


let imageCache = NSCache<AnyObject, AnyObject>(  )
extension UIImageView{
    func load(urlString: String){
        
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage{
            self.image = image
            return
        }
        guard let url = URL(string: urlString)else{
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }

    }
}
