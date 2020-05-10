//
//  HomePageReactor.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/18.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation
import RxSwift
import ReactorKit

enum SearchType {
    case team
    case player
}

final class HomePageReactor: Reactor {
    enum Action {
        case search(String, type: SearchType)
    }
    
    enum Mutation {
        case setSearchTeamResult(result: TeamResult?)
        case setSearchPlayerResult(result: PlayerResult?)
        case setLoading(Bool)
        case reset
        case empty
    }
    
    struct State {
        var loading: Bool = false
        var teamResult: TeamResult?
        var playerResult: PlayerResult?
    }
    
    let initialState: HomePageReactor.State
    
    let api = APIService()
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .search(let text, let type):
            let loading = Observable.just(Mutation.setLoading(true))
            let loadingDone = Observable.just(Mutation.setLoading(false))
            let reset = Observable.just(Mutation.reset)
            let searchTeamResult = api.searchTeam(text)
                .asObservable()
                .map { Mutation.setSearchTeamResult(result: $0) }
            let searchPlayer = api.searchPlayer(text)
                .asObservable()
                .map { Mutation.setSearchPlayerResult(result: $0) }
            
            return Observable.from([loading,
                                    type == .player ? searchPlayer : searchTeamResult,
                                    loadingDone,
                                    reset]).concat()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setSearchTeamResult(let result):
            state.teamResult = result
        case .setSearchPlayerResult(let result):
            state.playerResult = result
        case .setLoading(let loading):
            state.loading = loading
        case .reset:
            state = initialState
        case .empty:
            break
        }
        return state
    }
}

