//
//  
//  HomeViewController.swift
//  FoodRescure
//
//  Created by Thao Vo on 31/07/2023.
//
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import RswiftResources

// MARK: - PresentableListener
protocol HomePresentableListener: AnyObject {
}

// MARK: - ViewController
final class HomeViewController: UIViewController, HomePresentable {
    
    @IBOutlet weak var tableView: UITableView!
    weak var listener: HomePresentableListener?
    
    var viewModel: HomeViewModelType?
    let cellsModel = BehaviorRelay<[HomeSectionType]>(value: [])
    typealias Section = SectionModel<String, HomeSectionType>
    typealias DataSource = RxTableViewSectionedReloadDataSource<Section>
    private lazy var dataSource = initDataSource()
    // Private variable
    private let disposeBag = DisposeBag()
    
    // Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        configureTableView()
    }
}

// MARK: - Configure
extension HomeViewController {
    private func configureUI() {
        // Add here the setup for the UI
    }
    
    private func configureViewModel() {
        viewModel?.presenter = self
        viewModel?.didBecomeActive()
    }
    
    private func configureTableView() {
        tableView.register(R.nib.bannerTableViewCell)
        tableView.register(R.nib.homeHeaderTableViewCell)
        tableView.register(R.nib.locationTableViewCell)
        tableView.register(R.nib.recentFoodPostTableViewCell)
        tableView.register(R.nib.recentVisitTableViewCell)
        tableView.register(R.nib.restaurantNearYouTableViewCell)
        
        cellsModel
            .asDriver(onErrorJustReturn: [])
            .map { [Section(model: "", items: $0)] }
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
extension HomeViewController {
    func initDataSource() -> RxTableViewSectionedReloadDataSource<Section> {
        return RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { [weak self] (_, tableView, indexPath, cellType) -> UITableViewCell in
                guard let self = self else { return UITableViewCell() }
                
                switch cellType {
                case .banner:
                    let cell: BannerTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bannerTableViewCell, for: indexPath)
                    return cell ?? UITableViewCell()

                case let .location(model):
                    let cell: LocationTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.locationTableViewCell, for: indexPath)
                    cell?.model = model
                    return cell ?? UITableViewCell()
                    
                case let .header(model):
                    let cell: HomeHeaderTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeHeaderTableViewCell, for: indexPath)
                    cell?.model = model
                    return cell ?? UITableViewCell()
                    
                case let .recentVisit(model):
                    let cell: RecentVisitTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.recentVisitTableViewCell, for: indexPath)
                    cell?.model = model
                    return cell ?? UITableViewCell()
                case let .nearYou(model):
                    let cell: RestaurantNearYouTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.restaurantNearYouTableViewCell, for: indexPath)
                    cell?.model = model
                    return cell ?? UITableViewCell()
                case let .recentPost(model):
                    let cell: RecentFoodPostTableViewCell? = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.recentFoodPostTableViewCell, for: indexPath)
                    cell?.model = model
                    return cell ?? UITableViewCell()
                }
        })
    }
}
