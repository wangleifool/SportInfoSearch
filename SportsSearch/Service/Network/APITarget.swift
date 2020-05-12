//
//  APIService.swift
//  WhoTapFast
//
//  Created by JackSen on 2020/3/20.
//  Copyright © 2020 JackSen. All rights reserved.
//

import Foundation
import Moya

enum APITarget {
    case appVersion
    case player(searchText: String)
    case team(searchText: String)
//    case event(searchText: String)
}

extension APITarget: TargetType {
    var baseURL: URL {
        var urlString: String
        switch self {
        case .appVersion:
            urlString = "https://materCup.github.io"
        case .player, .team:
            urlString = "https://www.thesportsdb.com"
        }
        
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        return url
    }

    var path: String {
        switch self {
        case .appVersion:
            return "/appVersion.json"
        case .player:
            return "/api/v1/json/1/searchplayers.php"
        case .team:
            return "/api/v1/json/1/searchteams.php"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        var parameters: [String: Any] = [:]
        
        switch self {
        case .appVersion:
            parameters["id"] = "TestJump"
        case .player(let searchText):
            parameters["p"] = searchText
        case .team(let searchText):
            parameters["t"] = searchText
        }
        
        return Task.requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
    }

    var headers: [String: String]? {
        return nil
    }
}
