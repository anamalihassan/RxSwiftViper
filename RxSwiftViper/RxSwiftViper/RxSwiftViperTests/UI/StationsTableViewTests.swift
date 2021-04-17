//
//  StationsTableViewTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble

@testable import RxSwiftViper

class StationsTableViewTests: QuickSpec {
    
    override func spec() {
        var sutViewController: StationsViewController!
        var stations: [StationObject]!
        
        describe("StationsViewControllerTests initialization") {
            beforeEach {
                stations = [StationObject(id: 1, name: "Berlin ZOB"), StationObject(id: 10, name: "Munich ZOB")]
                sutViewController = StationsRouter.createModule()
                
                sutViewController.showBusStations(stations: stations)
            }
            
            it("cell view must not equal nil") {
                let cell = getStationTableViewCell()
                expect(cell).notTo(beNil())
            }
            
            it("cell stationTitle Label must not equal nil") {
                let cell = getStationTableViewCell()
                expect(cell.stationTitle).notTo(beNil())
            }
            
            it("cell stationTitle text must be equal to first data name ") {
                let cell = getStationTableViewCell()
                expect(cell.stationTitle.text).to(equal(stations[0].name))
            }
        }
        
        func getStationTableViewCell() -> StationTableViewCell{
            let indexPath = IndexPath.init(row: 0, section: 0)
            let cell = sutViewController.tableView.dataSource?.tableView(sutViewController.tableView, cellForRowAt: indexPath) as! StationTableViewCell
            return cell
        }
        
    }
}
