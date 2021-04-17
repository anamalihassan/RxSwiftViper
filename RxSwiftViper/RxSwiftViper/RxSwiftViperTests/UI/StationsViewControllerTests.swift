//
//  StationsViewControllerTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//


import Quick
import Nimble

@testable import RxSwiftViper

class StationsViewControllerTests: QuickSpec {
    
    override func spec() {
        var sutViewController: StationsViewController!
        var stations: [StationObject]!
        
        describe("StationsViewControllerTests initialization") {
            beforeEach {
                stations = [StationObject(id: 1, name: "Berlin ZOB"), StationObject(id: 10, name: "Munich ZOB")]
                sutViewController = StationsRouter.createModule()
                
                sutViewController.showBusStations(stations: stations)
            }
            
            it("number of stations should equal to nubmer of table rows") {
                expect(sutViewController.tableView.numberOfRows(inSection: 0)).to(equal(stations.count))
            }
        }
        
    }
}

