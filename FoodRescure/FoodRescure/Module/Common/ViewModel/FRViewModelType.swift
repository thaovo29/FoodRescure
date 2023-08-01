//
//  FRViewModelType.swift
//  FoodRescure
//
//  Created by Thao Vo on 31/07/2023.
//

import Foundation
import RxSwift

public protocol FRViewModelType {
    var disposeBag: DisposeBag { get }
    func didBecomeActive()
}
