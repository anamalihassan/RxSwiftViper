//
//  NetworkService.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import Moya

enum NetworkService {
    case busesSchedule(station_id: Int)
}

extension NetworkService : TargetType {
    public var baseURL: URL {
        return URL(string: Constants.BASE_URL)!
    }
    
    public var path: String {
        switch self {
        case .busesSchedule(station_id: let station_id):
            return Constants.APIPath.BUSES_SCHEDULE + "\(station_id)/timetable"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let parameters = ["Content-Type": "application/json", "Accept": "application/json", "X-API-Authentication": Constants.APIToken.authorizationToken]
        return parameters
    }
}
