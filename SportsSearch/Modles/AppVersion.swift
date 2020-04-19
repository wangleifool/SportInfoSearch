//
//  AppVersion.swift
//  JumpGame
//
//  Created by JackSen on 2020/3/22.
//  Copyright © 2020 JackSen. All rights reserved.
//

import Foundation

struct AppVersion {
    var version: String?
    var idiom: String?
    var message: String?
    var code: String?
}

extension AppVersion: Decodable {
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case idiom = "idiom"
        case message = "message"
        case code = "code"
    }
}
