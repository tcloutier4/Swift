//
//  FilterSettingsTableViewCell.swift
//  CourseProject
//
//  Created by user196933 on 8/12/21.
//

import UIKit

class FilterSettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
