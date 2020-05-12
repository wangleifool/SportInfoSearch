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
    
    static let appID = "1505075520"
    
    static let jpushKey = "41aed45484797ef7ce6103f6"
}

struct PathConst {
    static let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                             .userDomainMask, true)[0]
    static let dbPath = "/db.sqlite3"
}
