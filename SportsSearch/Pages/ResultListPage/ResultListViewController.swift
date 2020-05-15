//
//  ResultListViewController.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/11.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import SABlurImageView

class ResultListViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.register(PlayerBreifInfoTableViewCell.self)
        }
    }
    
    @IBOutlet weak var bgImgView: SABlurImageView! {
        didSet {
            self.bgImgView.configrationForBlurAnimation()
            self.bgImgView.blur(1)
        }
    }
    
    private var isShowStarPlayer: Bool = false
    private var players: [Player] = []
    
    static func instance(with players: [Player], showStarPlayer: Bool = false) -> ResultListViewController {
        let vc = ResultListViewController()
        vc.players = players
        vc.isShowStarPlayer = showStarPlayer
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (isShowStarPlayer) {
            players = DBService.shared.getPlayer()
        }
        tableView.reloadData()
    }
    
    private func unstarPlayer(with indexPath: IndexPath) {
        guard let player = players.safeElement(indexPath.row) else { return }
        DBService.shared.deletePlayer(with: player.strPlayer ?? "")
        players = DBService.shared.getPlayer()
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let player = players.safeElement(indexPath.row) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(PlayerBreifInfoTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        var isStar = isShowStarPlayer
        if (!isShowStarPlayer) {
            isStar = DBService.shared.getPlayer(with: player.strPlayer).count == 1
        }
        cell.updateCell(player, isStarred: isStar)
        
        cell.starBtnTapped
            .drive(onNext: { [weak self] _ in
                if (self?.isShowStarPlayer ?? false) {
                    self?.unstarPlayer(with: indexPath)
                }
            })
            .disposed(by: cell.disposeBag)
        
        return cell
    }
    
    
}

extension ResultListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let player = players.safeElement(indexPath.row) else { return }
        let isStarred = DBService.shared.getPlayer(with: player.strPlayer ?? "").count > 0
        let playerDetailPage = PlayerDetailViewController.instance(player: player, isStarred: isStarred)
        navigationController?.pushViewController(playerDetailPage, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
