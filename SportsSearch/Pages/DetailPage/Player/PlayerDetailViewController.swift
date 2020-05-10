//
//  PlayerDetailViewController.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/10.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit

class PlayerDetailViewController: BaseViewController {
    
    private var player: Player!
    
    @IBOutlet private weak var bgImgView: UIImageView!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.tableFooterView = UIView(frame: .zero)
            self.tableView.separatorStyle = .none
            if #available(iOS 11.0, *) {
                self.tableView.contentInsetAdjustmentBehavior = .never
            }
//            self.tableView.rowHeight = automaticDimension
//            self.tableView.estimatedRowHeight = 160
            self.tableView.register(PlayerBreifInfoTableViewCell.self)
            self.tableView.register(PlayerPhotoCollectionTableViewCell.self)
        }
    }
    
    // MARK: - life cycle
    static func instance(player: Player) -> PlayerDetailViewController {
        let vc = PlayerDetailViewController()
        vc.player = player
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let bgResource = player.strBanner {
            bgImgView.kf.setImage(with: URL(string: bgResource))
        }
    }

    @IBAction func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return Const.screenWidth * 3 / 4
        default:
            return 0
        }
    }
}

extension PlayerDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(PlayerBreifInfoTableViewCell.self, for: indexPath)
            cell.updateCell(player)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(PlayerPhotoCollectionTableViewCell.self, for: indexPath)
            let photoUrls = [player.strFanart1,
                             player.strFanart2,
                             player.strFanart3,
                             player.strFanart4].compactMap { $0 }
            cell.updateCell(with: photoUrls)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}
