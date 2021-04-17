//
//  StationsPresenter.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

class StationsPresenter: StationsViewToPresenterProtocol {
    
    var view: StationsPresenterToViewProtocol?
    
    var interactor: StationsPresenterToInteractorProtocol?
    
    var router: StationsPresenterToRouterProtocol?
    
    func fetchingStations() {
        interactor?.fetchingStations()
    }
    
    func showBusesScheduleController(navigationController: UINavigationController, stationObject: StationObject) {
        router?.showBusesScheduleController(navigationController: navigationController, stationObject: stationObject)
    }
}

extension StationsPresenter: StationsInteractorToPresenterProtocol {
    func showBusStations(stations: [StationObject]?) {
        view?.showBusStations(stations: stations)
    }
    
    func fetchFailed(error: String) {
        view?.showError(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
}
