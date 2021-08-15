//
//  WeekPlanViewController.swift
//  CourseProject
//
//  Created by user196933 on 8/6/21.
//

import UIKit

class WeekPlanViewController: UIViewController {

    @IBOutlet weak var weekPlanTableView: UITableView!
    
    let dataManager = SelectedRecipeCoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weekPlanTableView.dataSource = self
        weekPlanTableView.delegate = self
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

extension WeekPlanViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.fetchAllSelectedRecipes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell
        
        let currentSelected = dataManager.fetchAllSelectedRecipes()[indexPath.row]
        cell.mealNameLabel.text = currentSelected.mealName
        cell.categoryLabel.text = currentSelected.mealCategory
        cell.imageView?.load(urlString: currentSelected.mealThumb!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataManager.deleteSelectedRecipes(at: indexPath.row)
            print(dataManager.fetchAllSelectedRecipes())
            weekPlanTableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    

}

extension WeekPlanViewController : UITableViewDelegate{
    override func viewDidAppear(_ animated: Bool) {
        weekPlanTableView.reloadData()
    }
}
