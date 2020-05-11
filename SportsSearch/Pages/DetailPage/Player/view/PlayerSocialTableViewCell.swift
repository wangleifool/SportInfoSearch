//
//  PlayerSocialTableViewCell.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/11.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import RxCocoa

class PlayerSocialTableViewCell: BaseTableViewCell {

    @IBOutlet private weak var facebookBtn: UIButton!
    @IBOutlet private weak var twitterBtn: UIButton!
    @IBOutlet private weak var instagramBtn: UIButton!
    
    var facebookTap: Driver<Void> {
        return facebookBtn.rx.tap
            .asDriver()
            .debounce(0.1)
    }
    
    var twitterTap: Driver<Void> {
        return twitterBtn.rx.tap
            .asDriver()
            .debounce(0.1)
    }
    
    var instagramTap: Driver<Void> {
        return instagramBtn.rx.tap
            .asDriver()
            .debounce(0.1)
    }
    
}
