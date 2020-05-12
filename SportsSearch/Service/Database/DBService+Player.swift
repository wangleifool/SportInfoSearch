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

    func getPlayer(with name: String) -> Player? {
        let query = StarPlayerTB.table.filter(StarPlayerTB.name == name)
        do {
            guard let queryResult = try db?.prepare(query) else { return nil }
            var player = Player()
            player.na
        } catch {
            print("get FlyerDetail fail \(error)")
        }
        return nil
    }
    
    func getFlyerDetail(id: Int?) -> FlyerDetailModel? {
        guard let flyerID = id else {
            return nil
        }
        let queryFlyer = FlyersDetailTB.table.filter(FlyersDetailTB.flyerID == flyerID)
        do {
            guard let queryResult = try db?.prepare(queryFlyer) else {
                return nil
            }
            let result = queryResult.compactMap { (row) -> FlyerDetailModel in
                let images = FlyerDetailModel.unarchiveStringToImages(row[FlyersDetailTB.images])
                return FlyerDetailModel(id: row[FlyersDetailTB.flyerID],
                                        shopCode: row[FlyersDetailTB.shopCode],
                                        shopName: row[FlyersDetailTB.shopName],
                                        periodFrom: row[FlyersDetailTB.periodFrom],
                                        periodTo: row[FlyersDetailTB.periodTo],
                                        lastUpdate: row[FlyersDetailTB.lastUpdate],
                                        title: row[FlyersDetailTB.title],
                                        body: row[FlyersDetailTB.body],
                                        images: images)
            }
            return result.first

        } catch {
            print("get FlyerDetail fail \(error)")
        }
        return nil
    }
}

