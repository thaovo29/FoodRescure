//
//  LocationTableViewCell.swift
//  FoodRescure
//
//  Created by Thao Vo on 28/07/2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }
    
    private func configureUI() {
//        self.backgroundView?.layer.cornerRadius = 8
//        self.backgroundView?.layer.borderColor = .init(gray: 1, alpha: 0.5)
//        self.backgroundView?.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.gray.withAlphaComponent(0.8).cgColor
        borderView.layer.borderWidth = 0.5
        borderView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var model: LocationTableViewCellModel? {
        didSet {
            locationLabel.text = model?.location
        }
    }
}
struct LocationTableViewCellModel {
    var location: String?
    var lo: Float?
    var li: Float?
}
