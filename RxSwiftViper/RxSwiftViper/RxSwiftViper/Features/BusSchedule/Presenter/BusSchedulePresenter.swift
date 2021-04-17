//
//  BusSchedulePresenter.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

class BusesSchedulePresenter: BusesScheduleViewToPresenterProtocol {
    
    var view: BusesSchedulePresenterToViewProtocol?
    
    var interactor: BusesSchedulePresenterToInteractorProtocol?
    
    var router: BusesSchedulePresenterToRouterProtocol?
    
    func fetchingBusesSchedule(station_id: Int) {
        interactor?.fetchingBusesSchedule(station_id: station_id)
    }
    
    func toggleDeparture() {
        isDeparture = !isDeparture
    }
    
    var isDeparture = true{
        didSet {
            setUpBusesSchedule()
        }
    }
    private func setUpBusesSchedule(){
        if isDeparture {
            self.view?.showBusesSchedule(busesSchedule: departuresBusesSchedule)
        }else {
            self.view?.showBusesSchedule(busesSchedule: arrivalsBusesSchedule)
        }
    }
    
    private var departuresBusesSchedule: [BusScheduleSection] = []
    private var arrivalsBusesSchedule: [BusScheduleSection] = []
}

extension BusesSchedulePresenter: BusesScheduleInteractorToPresenterProtocol {
    func fetchFailed(error: String) {
        view?.showError(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
    
    func busesScheduleResponse(response: BusesScheduleResult?) {
        if let departures = response?.timetable?.departures {
            departuresBusesSchedule = Utils.groupedSectionsByDate(from: departures)
        }
        if let arrivals = response?.timetable?.arrivals {
            arrivalsBusesSchedule = Utils.groupedSectionsByDate(from: arrivals)
        }
        self.view?.showBusesSchedule(busesSchedule: departuresBusesSchedule)
    }
}
