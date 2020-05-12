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
    case rugby
    case volleyball
    case tableTennis
    case others
    
    var icon: UIImage {
        switch self {
        case .badminton:
            return #imageLiteral(resourceName: "badminton")
        case .basketball:
            return #imageLiteral(resourceName: "basketball")
        case .football:
            return #imageLiteral(resourceName: "soccer ball")
        case .tennis:
            return #imageLiteral(resourceName: "tennis")
        case .rugby:
            return #imageLiteral(resourceName: "rugby")
        case .volleyball:
            return #imageLiteral(resourceName: "volleyball")
        case .tableTennis:
            return #imageLiteral(resourceName: "table tennis")
        default:
            return #imageLiteral(resourceName: "sportsOther")
        }
    }
    
    var headerPlaceholder: UIImage {
        switch self {
        case .tennis, .badminton:
            return #imageLiteral(resourceName: "netHeader")
        case .football:
            return #imageLiteral(resourceName: "footballHeader")
        case .rugby:
            return #imageLiteral(resourceName: "rugbyHeader")
        default:
            return #imageLiteral(resourceName: "basketballHeader")
        }
    }
    
    static func make(with text: String?) -> SportsType {
        guard let text = text else { return .others }

        if (text.localizedCaseInsensitiveContains("basketball")) {
            return .basketball
        }
        
        if (text.localizedCaseInsensitiveContains("football") || text.localizedCaseInsensitiveContains("soccer")) {
            return .football
        }
        
        if (text.localizedCaseInsensitiveContains("tennis")) {
            return .tennis
        }
        
        if (text.localizedCaseInsensitiveContains("badminton")) {
            return .badminton
        }
        
        if (text.localizedCaseInsensitiveContains("rugby")) {
            return .rugby
        }
        
        if (text.localizedCaseInsensitiveContains("volleyball")) {
            return .volleyball
        }
        
        if (text.localizedCaseInsensitiveContains("table") && text.localizedCaseInsensitiveContains("tennis")) {
            return .tableTennis
        }
        
        return .others
    }
}
