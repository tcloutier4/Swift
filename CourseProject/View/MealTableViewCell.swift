//
//  MealTableViewCell.swift
//  CourseProject
//
//  Created by user196933 on 8/11/21.
//

import UIKit

protocol MealTableViewCellDelegate: AnyObject {
    func favoriteButton(with title: String)
}

class MealTableViewCell: UITableViewCell {


    
    let dataManager = FavoriteCoreDataManager()
    
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButton(_ sender: Any) {
        
        
        let index = dataManager.fetchOneFavorite(mealName: self.mealNameLabel.text!)
        if self.favoriteButton.currentImage == UIImage(systemName: "star.fill"){

            //self.dataManager.deleteFavorite(at: index)
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
               // }
        } else{
//            isFavorite.remove(at: index)
//            TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in
//                for currentMeal in currentMealResponse.meals{
//                    let mealID = currentMeal.idMeal
//                    let mealName = currentMeal.strMeal
//                    let category = currentMeal.strCategory
//                    let mealThumb = currentMeal.strMealThumb
//                    print(mealID + mealName)
                  //  self.dataManager.addFavorite(withMealID: mealID, withMealName: mealName, withMealCategory: category, withMealThumb: mealThumb)
                    
              //  }
                
            //}

            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
       

            
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        if dataManager.fetchOneFavorite(mealName: self.mealNameLabel.text!) != -1{
//            self.favoriteButton.setImage(UIImage(systemName: "star.filled"), for: .normal)
//        }
//        else{
//            self.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
//
//        }
//
        // Initialization code
        favoriteButton.addTarget(self, action: #selector(favoriteButton(_:)), for: .touchUpInside)
    }


    
//



}
