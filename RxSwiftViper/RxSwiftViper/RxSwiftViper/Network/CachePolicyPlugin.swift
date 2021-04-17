//
//  CachePolicyPlugin.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 07/03/2021.
//

import Moya

protocol CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let cachePolicyGettable = target as? CachePolicyGettable {
            var mutableRequest = request
            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
            return mutableRequest
        }

        return request
    }
}

extension NetworkService: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        default:
            return .reloadIgnoringLocalAndRemoteCacheData
        }
    }
}
