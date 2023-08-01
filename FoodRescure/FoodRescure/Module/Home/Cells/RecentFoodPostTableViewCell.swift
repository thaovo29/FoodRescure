//
//  RecentFoodPostTableViewCell.swift
//  FoodRescure
//
//  Created by Thao Vo on 29/07/2023.
//

import UIKit

class RecentFoodPostTableViewCell: UITableViewCell {

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopFoodTypes: UILabel!
    @IBOutlet weak var shopDistanceLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var model: RecentFoodPostTableViewCellModel? {
        didSet {
            
        }
    }
}

struct RecentFoodPostTableViewCellModel {
    
}
