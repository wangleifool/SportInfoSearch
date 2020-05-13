//
//  DBService+Player.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/12.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation
import SQLite

extension DBService {
    func insertPlayer(_ player: Player) {
        do {
            // the primary key must have value
            guard let name = player.strPlayer else {
                return
            }
            try db?.run(StarPlayerTB.table.insert(or: .replace,
                                                  StarPlayerTB.name <- name,
                                                  StarPlayerTB.location <- player.strBirthLocation,
                                                  StarPlayerTB.sports <- player.strSport,
                                                  StarPlayerTB.country <- player.strNationality,
                                                  StarPlayerTB.number <- player.strNumber,
                                                  StarPlayerTB.description <- player.strDescriptionEN,
                                                  StarPlayerTB.thumbUrl <- player.strThumb,
                                                  StarPlayerTB.bannerUrl <- player.strBanner,
                                                  StarPlayerTB.photos <- player.archiveImagesToString()))
        } catch {
            print("FlyerDetail insert fail \(error)")
        }
    }
    
    func deletePlayer(with name: String) {
        let deletePlayer = StarPlayerTB.table.filter(StarPlayerTB.name == name)
        do {
            try db?.run(deletePlayer.delete())
        } catch {
            print("delete player fail \(error)")
        }
    }

    func getPlayer(with name: String? = nil) -> [Player] {
        var query = StarPlayerTB.table
        if let playerName = name {
            query = query.filter(StarPlayerTB.name == playerName)
        }
        do {
            guard let queryResult = try db?.prepare(query) else { return [] }
            let result = queryResult.compactMap { (row) -> Player? in
                return Player(name: row[StarPlayerTB.name],
                              location: row[StarPlayerTB.location],
                              sports: row[StarPlayerTB.sports],
                              coutry: row[StarPlayerTB.country],
                              number: row[StarPlayerTB.number],
                              description: row[StarPlayerTB.description],
                              thumbUrl: row[StarPlayerTB.thumbUrl],
                              bannerUrl: row[StarPlayerTB.bannerUrl],
                              photos: row[StarPlayerTB.photos],
                              facebook: row[StarPlayerTB.facebook],
                              twitter: row[StarPlayerTB.twitter],
                              instagram: row[StarPlayerTB.instagram])
            }
            return result
        } catch {
            print("get player fail \(error)")
        }
        return []
    }
}

