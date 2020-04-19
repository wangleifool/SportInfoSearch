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
            let blurEffect = U
        }
    }
    
    private var result: TeamResult?
    
    static func instance(result: TeamResult) -> DetailViewController {
        let vc = DetailViewController()
        vc.result = result
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgResource = result?.teams?.first?.strTeamFanart1 ?? ""
        let placeHolder = #imageLiteral(resourceName: "nodata")
        bgImgView.kf.setImage(with: URL(string: bgResource),
                              placeholder: placeHolder,
                              options: [.transition(.fade(0.5))])
    }


    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
