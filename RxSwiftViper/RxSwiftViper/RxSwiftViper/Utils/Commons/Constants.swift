//
//  Constants.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import Foundation
private enum Servers{
    static let DEV = "https://global.api-dev.flixbus.com"
}

class Constants{
    
    public static let BASE_URL = Servers.DEV
    
    enum APIPath{
        public static let BUSES_SCHEDULE = "/mobile/v1/network/station/"
    }
    
    enum APIToken{
        static let authorizationToken = "intervIEW_TOK3n"
    }
    
    enum APIMessages {
        static let NetworkError = "An error occurred while fetching data"
        static let DataDecodingError = "An error occurred while decoding data"
        static let InvalidURL = "Invalid URL"
        static let Warning = "Warning"
        static let OK = "OK"
    }
    
    enum App{
        static let SELECT_STATION_MSG = "Stations"
        static let CLOSE_MSG = "Close"
    }
    
    enum Assets{
        public static let BUS_SCHEDULE_DATA = "BusScheduleData"
        static let ICON_RIGHT = "chevron.right"
        static let ICON_DEPARTURE = "arrow.down.circle"
        static let ICON_ARRIVAL = "arrow.up.circle"
    }
}

