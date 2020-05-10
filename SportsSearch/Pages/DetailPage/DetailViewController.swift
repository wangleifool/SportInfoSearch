//
//  DetailViewController.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/19.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Kingfisher
import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var bgImgView: UIImageView! {
        didSet {
            let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            blurEffect.frame = UIScreen.main.bounds
            bgImgView.addSubview(blurEffect)
        }
    }
    
    private var result: Team?
    
    static func instance(result: Team) -> DetailViewController {
        let vc = DetailViewController()
        vc.result = result
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgResource = result?.strTeamFanart1 ?? ""
        let placeHolder = #imageLiteral(resourceName: "nodata")
        bgImgView.kf.setImage(with: URL(string: bgResource),
                              placeholder: placeHolder,
                              options: [.transition(.fade(0.5))])
    }


    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
