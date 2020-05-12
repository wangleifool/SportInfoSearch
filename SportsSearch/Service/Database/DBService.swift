//
//  DBService.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/12.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation
import SQLite

class DBService {

    static let shared = DBService()

    let path = PathConst.docPath
    var db: Connection? = try? Connection(PathConst.docPath + PathConst.dbPath)
    private init() {
        do {
            try db?.transaction {
                createStarPlayerTable()
            }
        } catch {
            print(error)
        }
    }

    private func createStarPlayerTable() {
        do {
            try db?.run(StarPlayerTB.table.create(ifNotExists: true, block: { (table) in
                table.column(StarPlayerTB.name, primaryKey: true)
                table.column(StarPlayerTB.location)
                table.column(StarPlayerTB.sports)
                table.column(StarPlayerTB.country)
                table.column(StarPlayerTB.number)
                table.column(StarPlayerTB.description)
                table.column(StarPlayerTB.thumbUrl)
                table.column(StarPlayerTB.bannerUrl)
                table.column(StarPlayerTB.photos)
                table.column(StarPlayerTB.facebook)
                table.column(StarPlayerTB.twitter)
                table.column(StarPlayerTB.instagram)
            }))
        } catch {
            print("create StarPlayerTB table failed: \(error)")
        }
    }
}

struct StarPlayerTB {
    static let table = Table("StarPlayer")
    static let name = Expression<String>("name")
    static let location = Expression<String?>("location")
    static let sports = Expression<String?>("sports")
    static let country = Expression<String?>("country")
    static let number = Expression<String?>("number")
    static let description = Expression<String?>("description")
    static let thumbUrl = Expression<String?>("thumbUrl")
    static let bannerUrl = Expression<String?>("bannerUrl")
    static let photos = Expression<String?>("photos")
    static let facebook = Expression<String?>("facebook")
    static let twitter = Expression<String?>("twitter")
    static let instagram = Expression<String?>("instagram")
}
