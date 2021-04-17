//
//  NetworkManagerTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble
import RxSwift
@testable import RxSwiftViper

class NetworkManagerTests: QuickSpec {
    override func spec() {
        var service: NetworkManager!
        var disposeBag: DisposeBag!
        
        beforeEach {
            service = NetworkManager()
            disposeBag = DisposeBag()
        }
        
        describe("fetch buses schedule") {
            it("eventually return busesScheduleResult") {
                var busesScheduleResult: BusesScheduleResult? = nil
                
                service.getBusesScheduleForStationID(1)
                    .subscribe(onSuccess: { response in
                        busesScheduleResult = response
                    }).disposed(by: disposeBag)
                
                expect(busesScheduleResult).toEventuallyNot(beNil(), timeout: RxTimeInterval.milliseconds(5000))
                expect(busesScheduleResult?.timetable?.departures?.count).toEventually(beGreaterThanOrEqualTo(1), timeout: RxTimeInterval.milliseconds(5000))
                expect(busesScheduleResult?.timetable?.arrivals?.count).toEventually(beGreaterThanOrEqualTo(1), timeout: RxTimeInterval.milliseconds(5000))
            }
        }
    }
}
