//
//  StationsRouter.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

class StationsRouter: StationsPresenterToRouterProtocol {
    
    static func createModule() -> StationsViewController {
        let controller = StationsViewController()
        let presenter: StationsViewToPresenterProtocol & StationsInteractorToPresenterProtocol = StationsPresenter()
        let interactor: StationsPresenterToInteractorProtocol = StationsInteractor()
        let router: StationsPresenterToRouterProtocol = StationsRouter()
        
        controller.presentor = presenter
        controller.title = Constants.App.SELECT_STATION_MSG
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
    
    func showBusesScheduleController(navigationController: UINavigationController, stationObject: StationObject) {
        let detailModule = BusesScheduleRouter.createModule(stationObject: stationObject)
        navigationController.pushViewController(detailModule, animated: true)
    }
}
