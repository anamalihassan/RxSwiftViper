//
//  BusScheduleViewControllerTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble

@testable import RxSwiftViper

class BusScheduleViewControllerTests: QuickSpec {
    
    override func spec() {
        var sutResponse: [BusScheduleSection]!
        var sutViewController: BusScheduleViewController!
        
        describe("CarsListViewControllerTests initialization") {
            beforeEach {
                let response = StubGenerator().getBusScheduleResponseMock()
                
                sutViewController = BusesScheduleRouter.createModule(stationObject: StationObject(id: 1, name: "Berlin ZOB"))
                sutResponse = Utils.groupedSectionsByDate(from: (response?.timetable?.departures)!)
                sutViewController.showBusesSchedule(busesSchedule: sutResponse)
            }
            
            it("number of sections should equal to nubmer of table sections") {
                expect(sutViewController.tableView.numberOfSections).to(equal(sutResponse.count))
            }
            
            it("number of buses in section 0 should equal to nubmer of table rows in section 0") {
                expect(sutViewController.tableView.numberOfRows(inSection: 0)).to(equal(sutResponse[0].buses.count))
            }
        }
        
    }
}
