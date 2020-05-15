//
//  Const.swift
//  WhoTapFast
//
//  Created by JackSen on 2020/3/22.
//  Copyright © 2020 JackSen. All rights reserved.
//

import Foundation
import UIKit

struct Const {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    static let navigationBarHeight: CGFloat = 44.0
    static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    static let navBarAndStatusBarHeight: CGFloat = navigationBarHeight + statusBarHeight
    
    static let appID = "1513185447"
    
    static let jpushKey = "d861271beca80051aa5ba71e"
}

struct PathConst {
    static let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                             .userDomainMask, true)[0]
    static let dbPath = "/db.sqlite3"
}
