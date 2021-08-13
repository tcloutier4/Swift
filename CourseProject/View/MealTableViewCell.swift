//
//  MealTableViewCell.swift
//  CourseProject
//
//  Created by user196933 on 8/11/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    let dataManager = FavoriteCoreDataManager()
    
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        // Initialization code
    }

    @objc private func handleMarkAsFavorite(){

        if 1 == 0{

          //  TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in

                //for currentMeal in currentMealResponse.meals{
           // self.dataManager.fetchAllFavorites()
                    //self.dataManager.deleteFavorite(at: index)
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
               // }
        } else{
//            isFavorite.remove(at: index)
            TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in
                for currentMeal in currentMealResponse.meals{
                    let mealID = currentMeal.idMeal
                    let mealName = currentMeal.strMeal
                    let category = currentMeal.strCategory
                    let mealThumb = currentMeal.strMealThumb
                    print(mealID + mealName)
                //    self.dataManager.addFavorite(withMealID: mealID, withMealName: mealName, withMealCategory: category, withMealThumb: mealThumb)
                    
                }
                
            }

            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
       

            
        }
    }
    
//    @objc private func handleMarkAsFavorite(){
//        TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in
//            for currentMeal in currentMealResponse.meals{
//
//                if let index = self.isFavorite.firstIndex(of: self.mealNameLabel.text!){
//                    self.dataManager.delete(at: index)
//                    self.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
//                }
//            else{
//                self.dataManager.add(currentMeal)
//
//                self.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
//            }
//
//            }
//        }
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    



