//
//  DashboardPresenter.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import UIKit

class DashboardPresenter: ViewToPresenterDashboardProtocol {
    func nextView(_ item: [itemDashboard]) {
        router?.nextView(item)
    }
    

    // MARK: Properties
    weak var view: PresenterToViewDashboardProtocol?
    var interactor: PresenterToInteractorDashboardProtocol?
    var router: PresenterToRouterDashboardProtocol?
}

extension DashboardPresenter: InteractorToPresenterDashboardProtocol {
}
