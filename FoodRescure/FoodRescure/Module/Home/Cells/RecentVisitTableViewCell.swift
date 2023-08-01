//
//  RecentVisitTableViewCell.swift
//  FoodRescure
//
//  Created by Thao Vo on 29/07/2023.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class RecentVisitTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellsModel = BehaviorRelay<[RestaurantCollectionViewCellModel]>(value: [])
    typealias RestaurantSection = SectionModel<Int, RestaurantCollectionViewCellModel>
    typealias DataSource = RxCollectionViewSectionedReloadDataSource<RestaurantSection>
    lazy var dataSource = initDataSource()
    private var disposeBag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    var model: RecentVisitTableViewCellModel? {
        didSet {
            if let cells = model?.recentVisitRestaurant {
                self.cellsModel.accept(cells)
            }
        }
    }
    
    func configureCollectionView() {
        collectionView.register(R.nib.restaurantCollectionViewCell)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.sectionInset.left = 0
            layout.sectionInset.right = 10
            layout.sectionInset.bottom = 12
            layout.headerReferenceSize = CGSize.zero
            layout.footerReferenceSize = CGSize.zero
        }
        
        cellsModel
            .bind(to: collectionView.rx.items(
                cellIdentifier: R.reuseIdentifier.restaurantCollectionViewCell.identifier,
                cellType: RestaurantCollectionViewCell.self))
                { indexPath, cellVM, cell in
                    cell.model = cellVM
                }
        .disposed(by: disposeBag)
    }
    func initDataSource() -> RxCollectionViewSectionedReloadDataSource<RestaurantSection> {
            return RxCollectionViewSectionedReloadDataSource<RestaurantSection>(
                configureCell: { [weak self] (_, collectionView, indexPath, model) -> UICollectionViewCell in
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: R.reuseIdentifier.restaurantCollectionViewCell,
                        for: indexPath
                    )
                    
                    cell?.model = model
                    return cell ?? UICollectionViewCell()
                    
                })
        
    }
}

struct RecentVisitTableViewCellModel {
    var recentVisitRestaurant: [RestaurantCollectionViewCellModel]
}
