//
//  MealTableViewCell.swift
//  CourseProject
//
//  Created by user196933 on 8/11/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    let dataManager = FavoritesDataManager()
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isFavorite: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        // Initialization code
    }

    @objc private func handleMarkAsFavorite(){

        if let index = isFavorite.firstIndex(of: mealNameLabel.text!){

            TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in

                for currentMeal in currentMealResponse.meals{
                   // self.dataManager.delete(at: currentMeal.idMeal)

                }
            }
            isFavorite.remove(at: index)
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        else{

            TheMealDbApi.searchMealByName(mealName: mealNameLabel.text!) { currentMealResponse in
                for currentMeal in currentMealResponse.meals{
  
                    self.dataManager.add(currentMeal)

                }
            }
            isFavorite.append(mealNameLabel.text!)
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
        print(self.isFavorite)
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
