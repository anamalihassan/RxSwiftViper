//
//  StationsProtocol.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

protocol StationsViewToPresenterProtocol: class{
    
    var view: StationsPresenterToViewProtocol? {get set}
    var interactor: StationsPresenterToInteractorProtocol? {get set}
    var router: StationsPresenterToRouterProtocol? {get set}
    func fetchingStations()
    func showBusesScheduleController(navigationController: UINavigationController, stationObject: StationObject)
}

protocol StationsPresenterToViewProtocol: class{
    func showBusStations(stations: [StationObject]?)
    func showError(error: String)
    func isLoading(isLoading: Bool)
}

protocol StationsPresenterToRouterProtocol: class {
    static func createModule()-> StationsViewController
    func showBusesScheduleController(navigationController: UINavigationController, stationObject: StationObject)
}

protocol StationsPresenterToInteractorProtocol: class {
    var presenter: StationsInteractorToPresenterProtocol? {get set}
    func fetchingStations()
}

protocol StationsInteractorToPresenterProtocol: class {
    func showBusStations(stations: [StationObject]?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
