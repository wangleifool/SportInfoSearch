//
//  APIService.swift
//  WhoTapFast
//
//  Created by JackSen on 2020/3/20.
//  Copyright © 2020 JackSen. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct APIService {

    private static let manager: Manager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        let mgr = Manager.default
        mgr.startRequestsImmediately = false
        return mgr
    }()

    private static let endpoint = { (multiTarget: MultiTarget) -> Endpoint in
        let endpoint = MoyaProvider<MultiTarget>.defaultEndpointMapping(for: multiTarget)
        return endpoint
    }

    private let provider = MoyaProvider<MultiTarget>(endpointClosure: endpoint,
                                                     manager: manager)

    init() {
        let urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        URLCache.shared = urlCache
    }

    public func request<Traget: TargetType>(target: Traget) -> PrimitiveSequence<SingleTrait, Moya.Response> {
        let multiTarget = MultiTarget(target)
        return self.provider.rx.request(multiTarget)
            .filterSuccessfulStatusCodes()
            .flatMapAppError()
    }

    public func request<Target: TargetType, Element: Decodable>(target: Target,
                                                                element: Element.Type) ->
        PrimitiveSequence<SingleTrait, Element> {
        return self.request(target: target)
            .map(Element.self)
    }
}

struct APIErrorResponse: Decodable {
    var status: Int?
    var error: String?
    var type: String?

    var isFailed: Bool {
        return (error != nil)
    }
}

extension APIService {
    func requestAppVersion() -> Single<AppVersion> {
        return request(target: APITarget.appVersion, element: AppVersion.self)
    }
}
