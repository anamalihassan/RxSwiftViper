//
//  StationsInteractor.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import Foundation
import RxSwift

class StationsInteractor: StationsPresenterToInteractorProtocol {
    func fetchingStations() {
        presenter?.isLoading(isLoading: true)
        let stations: [StationObject] = [StationObject(id: 1, name: "Berlin ZOB"), StationObject(id: 10, name: "Munich ZOB")]
        self.stationsResponse(response: stations)
        presenter?.isLoading(isLoading: false)
    }
    
    var presenter: StationsInteractorToPresenterProtocol?
    
    private func stationsResponse(response: [StationObject]?) {
        self.presenter?.showBusStations(stations: response)
    }
}
