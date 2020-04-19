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

final class HomePageReactor: Reactor {
    enum Action {
        case search(String)
    }
    
    enum Mutation {
        case setSearchResult(result: TeamResult?)
        case setLoading(Bool)
        case reset
        case empty
    }
    
    struct State {
        var loading: Bool = false
        var result: TeamResult?
    }
    
    let initialState: HomePageReactor.State
    
    let api = APIService()
    
    init() {
        self.initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .search(let text):
            return api.searchTeam(text)
                .asObservable()
                .filter { $0 != nil }
                .map { Mutation.setSearchResult(result: $0) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setSearchResult(let result):
            state.result = result
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

