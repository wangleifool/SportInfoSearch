//
//  PlayerDetailViewController.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/10.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import RxCocoa

class PlayerDetailViewController: BaseViewController {
    
    private var player: Player!
    private var dataSource: [PlayerDetailSectionModel] = []
    
    var sportsType: SportsType {
        return SportsType.make(with: player.strSport)
    }
    
    @IBOutlet private weak var navBarView: UIView!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.tableFooterView = UIView(frame: .zero)
            self.tableView.separatorStyle = .none
            if #available(iOS 11.0, *) {
                self.tableView.contentInsetAdjustmentBehavior = .never
            }
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 160
            self.tableView.register(PlayerSocialTableViewCell.self)
            self.tableView.register(PlayerBreifInfoTableViewCell.self)
            self.tableView.register(PlayerDescTableViewCell.self)
            self.tableView.register(PlayerPhotoCollectionTableViewCell.self)
            
            setupHeaderView()
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

        setupDataSource()
    }
    
    func setupHeaderView() {
        let frame = CGRect(x: 0, y: 0, width: Const.screenWidth, height: Metric.headerHeight)
        let headerView = UIView(frame: frame)
        let imgView = UIImageView(frame: frame)
        headerView.addSubview(imgView)
        imgView.contentMode = .scaleAspectFill
        imgView.kf.setImage(with: URL(string: player.strBanner ?? ""),
                            placeholder: sportsType.headerPlaceholder,
                            options: [.transition(.fade(0.5))])
        self.tableView.tableHeaderView = headerView
//        self.tableView.sectionHeaderHeight = imgView.bounds.height
    }
    
    func setupDataSource() {
        var sectionModels: [PlayerDetailSectionModel] = [.breifInfo(player: player),
                                                         .social]
        
        let photoUrls = [player.strFanart1,
                         player.strFanart2,
                         player.strFanart3,
                         player.strFanart4].compactMap { $0 }
        if photoUrls.count > 0 {
            sectionModels.append(PlayerDetailSectionModel.photos(photoUrls))
        }
        
        if let desc = player.strDescriptionEN {
            sectionModels.append(PlayerDetailSectionModel.desc(text: desc, isFull: false))
        }
        self.dataSource = sectionModels
    }

    @IBAction func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let element = dataSource[indexPath.row]
        switch element {
        case .breifInfo:
            return 160
        case .social:
            return UITableView.automaticDimension
        case .desc(_, let isFull):
            return isFull ? UITableView.automaticDimension : 160
        case .photos:
            return Const.screenWidth * 3 / 4
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let element = dataSource[indexPath.row]
        if case PlayerDetailSectionModel.desc(let text, let isFull) = element {
//            tableView.beginUpdates()
            dataSource[indexPath.row] = PlayerDetailSectionModel.desc(text: text, isFull: !isFull)
            tableView.reloadRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
        }
    }
    
}

extension PlayerDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = dataSource[indexPath.row]
        switch element {
        case .breifInfo(let playerInfo):
            let cell = tableView.dequeueReusableCell(PlayerBreifInfoTableViewCell.self, for: indexPath)
            cell.updateCell(playerInfo)
            cell.selectionStyle = .none
            cell.starBtnTapped
                .drive(onNext: { _ in
                    
                })
                .disposed(by: disposeBag)
            return cell
        case .social:
            let cell = tableView.dequeueReusableCell(PlayerSocialTableViewCell.self, for: indexPath)
            cell.facebookTap
                .drive(onNext: { [weak self] _ in
                    if let facebookUrl = self?.player.strFacebook,
                        let url = URL(string: facebookUrl) {
                        UIApplication.shared.open(url.addSchemeIfNeeded(), options: [:], completionHandler: nil)
                    }
                })
                .disposed(by: cell.disposeBag)
            cell.twitterTap
                .drive(onNext: { [weak self] _ in
                    if let twitterUrl = self?.player.strTwitter,
                        let url = URL(string: twitterUrl) {
                        UIApplication.shared.open(url.addSchemeIfNeeded(), options: [:], completionHandler: nil)
                    }
                })
                .disposed(by: cell.disposeBag)
            cell.instagramTap
                .drive(onNext: { [weak self] _ in
                    if let insUrl = self?.player.strInstagram,
                        let url = URL(string: insUrl) {
                        UIApplication.shared.open(url.addSchemeIfNeeded(), options: [:], completionHandler: nil)
                    }
                })
            .disposed(by: cell.disposeBag)
            cell.selectionStyle = .none
            return cell
        case .desc(let text, _):
            let cell = tableView.dequeueReusableCell(PlayerDescTableViewCell.self, for: indexPath)
            cell.updateCell(with: text)
            return cell
        case .photos(let photoUrls):
            let cell = tableView.dequeueReusableCell(PlayerPhotoCollectionTableViewCell.self, for: indexPath)
            cell.updateCell(with: photoUrls)
            cell.selectionStyle = .none
            return cell
        }
    }
    
}

extension PlayerDetailViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let originHeight = Metric.headerHeight;
        if (scrollView.contentOffset.y < 0 ){

            let resizeScale = (0 - scrollView.contentOffset.y) / originHeight;
            let offset = 0 - scrollView.contentOffset.y;

            let frame = CGRect(x: 0 - (Const.screenWidth * resizeScale / 2),
                               y: 0 - offset,
                               width: CGFloat(roundf(Float(Const.screenWidth + Const.screenWidth * resizeScale))),
                               height: CGFloat(roundf(Float(originHeight + originHeight * resizeScale))))

            self.tableView.tableHeaderView?.subviews.first?.frame = frame //这个 UIImageView是headerView的子视图,这样拉伸时候才不会顶部出现位移空白

            self.tableView.tableHeaderView?.frame = CGRect(x: 0,
                                                           y: 0,
                                                           width: Const.screenWidth,
                                                           height: originHeight + offset)

        }
        
        let offsetY = scrollView.contentOffset.y;
        if (offsetY > originHeight) {
            let alpha = min(1, (offsetY - originHeight) / originHeight);
            self.navBarView.alpha = alpha
        } else {
            self.navBarView.alpha = 0
        }
    }
    
    struct Metric {
        private init() {}
        
        static let headerHeight: CGFloat = Const.screenWidth * 9 / 16
    }
}
