//
//  BusScheduleTableViewTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble

@testable import RxSwiftViper

class BusScheduleTableViewTests: QuickSpec {
    
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
            
            it("cell view must not equal nil") {
                let cell = getBusScheduleTableViewCell()
                expect(cell).notTo(beNil())
            }
            
            it("cell timeLabel Label must not equal nil") {
                let cell = getBusScheduleTableViewCell()
                expect(cell.timeLabel).notTo(beNil())
            }
            
            it("cell timeLabel text must be equal to first timeString") {
                let cell = getBusScheduleTableViewCell()
                expect(cell.timeLabel.text).to(equal(sutResponse[0].buses[0].datetime?.timeString))
            }
            
            it("cell titleLabel Label must not equal nil") {
                let cell = getBusScheduleTableViewCell()
                expect(cell.titleLabel).notTo(beNil())
            }
            
            it("cell titleLabel text must be equal to first line_direction ") {
                let cell = getBusScheduleTableViewCell()
                expect(cell.titleLabel.text).to(equal(sutResponse[0].buses[0].line_direction))
            }
        }
        
        func getBusScheduleTableViewCell() -> BusScheduleTableViewCell{
            let indexPath = IndexPath.init(row: 0, section: 0)
            let cell = sutViewController.tableView.dataSource?.tableView(sutViewController.tableView, cellForRowAt: indexPath) as! BusScheduleTableViewCell
            return cell
        }
        
    }
}
