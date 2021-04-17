//
//  BusScheduleResponseTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble

@testable import RxSwiftViper

class BusScheduleResponseTests: QuickSpec {
    
    override func spec() {
        
        describe("share cars response initialization") {
            
            var sutResponse: BusesScheduleResult!

            beforeEach {
                sutResponse = StubGenerator().getBusScheduleResponseMock()
            }
            
            it("departures must not be empty") {
                let bussesDeparturesCount = sutResponse.timetable?.departures?.count
                expect(bussesDeparturesCount).notTo(equal(0))
            }
            
            it("arrivals must not be empty") {
                let bussesArrivalsCount = sutResponse.timetable?.arrivals?.count
                expect(bussesArrivalsCount).notTo(equal(0))
            }
            
            it("timestamp must not be empty") {
                let timestamp = sutResponse.timetable?.departures?[0].datetime?.timestamp
                expect(timestamp).notTo(beNil())
            }
            
            it("time zone must not be empty") {
                let tz = sutResponse.timetable?.departures?[0].datetime?.tz
                expect(tz).notTo(beNil())
            }
            
            it("line_direction must not be empty") {
                let line_direction = sutResponse.timetable?.departures?[0].line_direction
                expect(line_direction).notTo(beNil())
            }
            
        }
    }
}
