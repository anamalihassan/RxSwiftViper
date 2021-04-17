//
//  AppURLs.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/02/2021.
//

import Foundation

enum ServiceTypeEndPoint: String {
    case timetable = "timetable"
}

struct AppURLs {
    
    private struct Domains {
        static let Dev = "https://global.api-dev.flixbus.com"
        static let UAT = "https://global.api-dev.flixbus.com"
//        static let Local = "192.145.1.1"
        static let QA = "https://global.api-dev.flixbus.com"
    }
    
    private  struct Routes {
        static let Api = "/mobile/v1/network/station"
    }
    
    private  static let Domain = Domains.Dev
    private  static let DomainIamage = Domains.UAT
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    //  https://global.api-dev.flixbus.com/mobile/v1/network/station/10/timetable
    enum APIEndpoints {
        case getTimeTableURL(station_id: Int, serviceType: String)
        var path: String {
            switch self {
            case let .getTimeTableURL(station_id, serviceType):
                return BaseURL  + "/\(station_id)/\(serviceType)"
            }
        }
    }
}
