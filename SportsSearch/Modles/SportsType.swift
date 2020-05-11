//
//  SportsType.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/11.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation
import UIKit

enum SportsType {
    case basketball
    case football
    case baseball
    case tennis
    case badminton
    case others
    
    var icon: UIImage {
        return UIImage()
    }
    
    var headerPlaceholder: UIImage {
        switch self {
        case .tennis, .badminton:
            return #imageLiteral(resourceName: "netHeader")
        default:
            return #imageLiteral(resourceName: "basketballHeader")
        }
    }
    
    static func make(with text: String?) -> SportsType {
        guard let text = text else { return .others }
        
        if (text.contains("basketball")) {
            return .basketball
        }
        
        if (text.contains("football") || text.contains("soccer")) {
            return .football
        }
        
        if (text.contains("tennis")) {
            return .tennis
        }
        
        if (text.contains("badminton")) {
            return .badminton
        }
        
        return .others
    }
}
