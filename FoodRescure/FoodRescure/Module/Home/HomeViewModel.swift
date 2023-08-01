//
//  
//  HomeViewModel.swift
//  FoodRescure
//
//  Created by Thao Vo on 31/07/2023.
//
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - ViewModelType
protocol HomeViewModelType: FRViewModelType {
    var presenter: HomePresentable? { get set }
    var router: HomeRouting? { get set }
    var listener: HomeViewModelListener? { get set }
}

// MARK: - Presentable
protocol HomePresentable: AnyObject {
    var listener: HomePresentableListener? { get set }
    var cellsModel: BehaviorRelay<[HomeSectionType]> { get }
}

// MARK: - Routing
protocol HomeRouting: AnyObject {
    
}

// MARK: - Listener
protocol HomeViewModelListener: AnyObject {
    
}

final class HomeViewModel: HomeViewModelType, HomePresentableListener {

    weak var presenter: HomePresentable?
    weak var router: HomeRouting?
    weak var listener: HomeViewModelListener?
    
    let disposeBag = DisposeBag()
    let cellsModel: [HomeSectionType] = [
        .banner,
        .location(LocationTableViewCellModel(location: "District 4")),
        .header(HomeHeaderTableViewCellModel(headerType: .recentVisit)),
        .recentVisit(
            RecentVisitTableViewCellModel(
                recentVisitRestaurant: [
                    RestaurantCollectionViewCellModel(shopDistanceLabel: "4.5 km"),
                    RestaurantCollectionViewCellModel(shopNameLabel: "123")
                ])),
        .header(HomeHeaderTableViewCellModel(headerType: .nearYou)),
        .nearYou(RestaurantNearYouTableViewCellModel()),
        .header(HomeHeaderTableViewCellModel(headerType: .recentPost)),
        .recentPost(RecentFoodPostTableViewCellModel())
    ]
    init() {
        
    }
    
    func didBecomeActive() {
        presenter?.listener = self
        configureListener()
        configurePresenter()
    }
}

// MARK: - Configiure
extension HomeViewModel {
    private func configureListener() {
        
    }
    
    private func configurePresenter() {
        self.presenter?.cellsModel.accept(cellsModel)
    }
}

enum HomeSectionType {
    case banner
    case location(LocationTableViewCellModel)
    case header(HomeHeaderTableViewCellModel)
    case recentVisit(RecentVisitTableViewCellModel)
    case nearYou(RestaurantNearYouTableViewCellModel)
    case recentPost(RecentFoodPostTableViewCellModel)
}
