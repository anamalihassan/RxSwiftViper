//
//  BusScheduleRouter.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

class BusesScheduleRouter: BusesSchedulePresenterToRouterProtocol {
    static func createModule(stationObject: StationObject) -> BusScheduleViewController {
        let controller = BusScheduleViewController(stationObject: stationObject)
        let presenter: BusesScheduleViewToPresenterProtocol & BusesScheduleInteractorToPresenterProtocol = BusesSchedulePresenter()
        let interactor: BusesSchedulePresenterToInteractorProtocol = BusesScheduleInteractor()
        let router: BusesSchedulePresenterToRouterProtocol = BusesScheduleRouter()
        
        controller.presentor = presenter
        controller.title = stationObject.name
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
