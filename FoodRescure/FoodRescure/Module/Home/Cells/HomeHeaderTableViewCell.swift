//
//  HomeHeaderTableViewCell.swift
//  FoodRescure
//
//  Created by Thao Vo on 29/07/2023.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var model: HomeHeaderTableViewCellModel? {
        didSet {
            headerLabel.text = model?.headerType.rawValue
        }
    }
}

struct HomeHeaderTableViewCellModel {
    var headerType: HeaderType
}

enum HeaderType: String {
    case recentVisit = "Recent visit"
    case nearYou = "Near you"
    case recentPost = "Recent post"
}
