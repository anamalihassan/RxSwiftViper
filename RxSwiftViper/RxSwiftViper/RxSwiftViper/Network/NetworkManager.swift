//
//  NetworkManager.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import RxSwift
import Moya
import RxCocoa

protocol FetchApiServices {
    func getBusesScheduleForStationID(_ station_id: Int) ->  Single<BusesScheduleResult?>
}

final class NetworkManager: FetchApiServices {
    
    private let provider = MoyaProvider<NetworkService>(plugins: [CachePolicyPlugin()])
    
    func request<T: Decodable>(networkService: NetworkService) -> Single<T?> {
//        if !Reachability.isConnectedToNetwork() {
//            return Single.error(APIError(with: .internetConnection, message: "No Internet Connection"))
//        }
        
        return provider
            .rx.request(networkService)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1)))
            .catchError { error -> PrimitiveSequence<SingleTrait, Response> in
                return Single.error(APIError(with: .unknown, message: error.localizedDescription))
            }.flatMap {json -> Single<T?> in
                if json.statusCode >= 200 && json.statusCode <= 300 {
                    let decoder = JSONDecoder()
                    if let response = try? decoder.decode(T.self, from: json.data) {
                        return Single.just(response)
                    }
                } else {
                    let error = APIError(with: .internalServerError, message: "Internal Server Error")
                    return Single.error(error)
                }
                let error = APIError(with: .unknown, message: "Failed to parse response")
                return Single.error(error)
            }
    }
    
    func getBusesScheduleForStationID(_ station_id: Int) ->  Single<BusesScheduleResult?> {
        return request(networkService: .busesSchedule(station_id: station_id))
    }
}
