//
//  PlayerBreifInfoTableViewCell.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/10.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import RxCocoa

class PlayerBreifInfoTableViewCell: BaseTableViewCell {

    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var sportsTypeImgView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    var starBtnTapped: Driver<Void> {
        return starBtn.rx.tap
            .asDriver()
            .debounce(0.1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ player: Player, isStarred: Bool = false) {
        avatarImgView.SCCornerRadius = 8
        if let thumb = player.strThumb,
            let thumbUrl = URL(string: thumb) {
            avatarImgView.isHidden = false
            avatarImgView.kf.setImage(with: thumbUrl)
        } else {
            avatarImgView.isHidden = true
        }
        locationLbl.text = player.strBirthLocation
        locationLbl.isHidden = locationLbl.text == nil
        playerNameLbl.text = player.strPlayer
        playerNameLbl.isHidden = playerNameLbl.text == nil
        ageLbl.text = player.strNumber
        ageLbl.isHidden = ageLbl.text == nil
        countryLbl.text = player.strNationality
        countryLbl.isHidden = countryLbl.text == nil
        sportsTypeImgView.image = SportsType.make(with: player.strSport).icon
        starBtn.setImage(isStarred ? #imageLiteral(resourceName: "starFill") : #imageLiteral(resourceName: "starEmpty"), for: .normal)
    }
    
}
