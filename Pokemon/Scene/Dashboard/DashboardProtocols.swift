//
//  DashboardProtocols.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDashboardProtocol: AnyObject {
    var presenter: ViewToPresenterDashboardProtocol? { get set}
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDashboardProtocol: AnyObject {
    var view: PresenterToViewDashboardProtocol? { get set }
    var interactor: PresenterToInteractorDashboardProtocol? { get set }
    var router: PresenterToRouterDashboardProtocol? { get set }
    func nextView(_ item: [itemDashboard])
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDashboardProtocol: AnyObject {
    var presenter: InteractorToPresenterDashboardProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDashboardProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDashboardProtocol {
    func nextView(_ item: [itemDashboard])
}
