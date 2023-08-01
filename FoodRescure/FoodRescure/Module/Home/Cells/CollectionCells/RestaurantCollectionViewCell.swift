//
//  RestaurantCollectionViewCell.swift
//  FoodRescure
//
//  Created by Thao Vo on 29/07/2023.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class RestaurantCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var shopDistanceLable: UILabel!
    @IBOutlet private weak var shopNameLabel: UILabel!
    @IBOutlet private weak var restaurantImage: UIImageView!
    var disposeBag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shopDistanceLable.text = "123"
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    var model: RestaurantCollectionViewCellModel? {
        didSet {
            shopDistanceLable.text = model?.shopDistanceLabel
            shopNameLabel.text = model?.shopNameLabel
            restaurantImage.image =  UIImage(named: "restaurant")
            if let img = model?.restaurantImage {
                restaurantImage.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "restaurant"))
            } 
        }
    }
}

struct RestaurantCollectionViewCellModel {
    var shopDistanceLabel: String?
    var shopNameLabel: String?
    var restaurantImage: String?
}
