//
//  APIService+Search.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/18.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation

extension APIService {
    func searchPlayer(_ player: String) -> Single<PlayerResult> {
        return request(target: APITarget.player(searchText: player), element: PlayerResult.self)
    }
    
    func searchTeam(_ team: String) -> Single<TeamResult> {
        return request(target: APITarget.team(searchText: team), element: TeamResult.self)
    }
}
