//
//  ConstantsTests.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import Quick
import Nimble

@testable import RxSwiftViper

class ConstantsTests: QuickSpec {
    override func spec() {
        describe("test Constant initialization") {
            
            it("BASE URL must be initialized") {
                let baseURL = Constants.BASE_URL
                let actualBaseURL = "https://global.api-dev.flixbus.com"
                expect(baseURL).to(equal(actualBaseURL))
            }
            
            it("Schedule endPoint must must be initialized") {
                let actualBusesScheduleEndPoint = "/mobile/v1/network/station/"
                let busesScheduleEndPoint = Constants.APIPath.BUSES_SCHEDULE
                expect(busesScheduleEndPoint).to(equal(actualBusesScheduleEndPoint))
            }
            
        }
    }
}
