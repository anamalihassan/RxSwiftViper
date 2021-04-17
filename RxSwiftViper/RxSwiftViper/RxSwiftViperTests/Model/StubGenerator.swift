//
//  StubGenerator.swift
//  RxSwiftViperTests
//
//  Created by Ali Hassan on 09/04/2021.
//

import XCTest

@testable import RxSwiftViper

class StubGenerator{
    
    func getBusScheduleResponseMock() -> BusesScheduleResult?{
        do {
            let path = Bundle.main.path(forResource: Constants.Assets.BUS_SCHEDULE_DATA, ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            guard let json = try? decoder.decode(BusesScheduleResult.self, from: data)  else {
                return nil
            }
            return  json
            
        }catch(let error){
            print (error.localizedDescription)
        }
        return nil
    }
}
