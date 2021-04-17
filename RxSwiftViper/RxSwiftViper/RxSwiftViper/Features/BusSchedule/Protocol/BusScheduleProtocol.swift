//
//  BusScheduleProtocol.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

protocol BusesScheduleViewToPresenterProtocol: class{
    
    var view: BusesSchedulePresenterToViewProtocol? {get set}
    var interactor: BusesSchedulePresenterToInteractorProtocol? {get set}
    var router: BusesSchedulePresenterToRouterProtocol? {get set}
    func fetchingBusesSchedule(station_id: Int)
    func toggleDeparture()
}

protocol BusesSchedulePresenterToViewProtocol: class{
    func showBusesSchedule(busesSchedule: [BusScheduleSection]?)
    func showError(error: String)
    func isLoading(isLoading: Bool)
}

protocol BusesSchedulePresenterToRouterProtocol: class {
    static func createModule(stationObject: StationObject)-> BusScheduleViewController
}

protocol BusesSchedulePresenterToInteractorProtocol: class {
    var presenter: BusesScheduleInteractorToPresenterProtocol? {get set}
    func fetchingBusesSchedule(station_id: Int)
}

protocol BusesScheduleInteractorToPresenterProtocol: class {
    func busesScheduleResponse(response: BusesScheduleResult?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}
