//
//  BusScheduleInteractor.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import RxSwift

class BusesScheduleInteractor: BusesSchedulePresenterToInteractorProtocol {
    var presenter: BusesScheduleInteractorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func fetchingBusesSchedule(station_id: Int) {
        presenter?.isLoading(isLoading: true)
        service.getBusesScheduleForStationID(station_id)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] response in
                guard let `self` = self, let busesSchedule = response else { return }
                self.busesScheduleResponse(response: busesSchedule)
                self.presenter?.isLoading(isLoading: false)
            }) { [weak self] error in
                guard let errorValue = error as? APIError else { return }
                self?.presenter?.fetchFailed(error: errorValue.message)
                self?.presenter?.isLoading(isLoading: false)
            }.disposed(by: disposeBag)
    }
    
    private func busesScheduleResponse(response: BusesScheduleResult?) {
        self.presenter?.busesScheduleResponse(response: response)
    }
}
