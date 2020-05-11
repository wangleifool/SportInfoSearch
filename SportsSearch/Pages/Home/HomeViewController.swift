//
//  HomeViewController.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/17.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import SHSearchBar
import RxSwift
import ReactorKit
import NVActivityIndicatorView

class HomeViewController: BaseViewController {
    
    var rasterSize: CGFloat = 11.0
    
    @IBOutlet weak var searchBtn: UIButton!
    var searchBar: SHSearchBar!

    lazy var loadingView: NVActivityIndicatorView = {
        var frame = CGRect(origin: .zero, size: CGSize(width: 54, height: 54))
        frame.origin = CGPoint(x: UIScreen.main.bounds.width / 2 - 27, y: UIScreen.main.bounds.height / 2 - 27)
        let loading = NVActivityIndicatorView(frame: frame,
                                              type: .ballSpinFadeLoader,
                                              color: .black,
                                              padding: 0)
        self.view.addSubview(loading)
        return loading
    }()
    
    private var apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reactor = HomePageReactor()
        configSearchBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardComeOut), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDismiss), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardComeOut(note: NSNotification) {
        
        guard let userInfo = note.userInfo,
            let keyBoardBounds = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curve = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }
        
        let deltaY = keyBoardBounds.size.height
        //5
        let animations:(() -> Void) = {
            self.searchBtn.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            let options = UIView.AnimationOptions(rawValue: UInt(curve) << 16)
            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    @objc private func keyboardDismiss(note: NSNotification) {
        guard let userInfo = note.userInfo,
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curve = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }

        let animations:(() -> Void) = {
            self.searchBtn.transform = CGAffineTransform.identity
        }

        if duration > 0 {
            let options = UIView.AnimationOptions(rawValue: UInt(curve) << 16)
            UIView.animate(withDuration: duration, delay: 0, options:options, animations: animations, completion: nil)
        } else {
            animations()
        }
              
    }
    
    @IBAction func searchBtnTap(_ sender: Any) {
        guard let text = searchBar.text,
            !text.isEmpty else { return }
        reactor?.action.onNext(.search(text, type: .player))
        searchBar.resignFirstResponder()
    }
    
    private func configSearchBar() {
        let searchGlassIconTemplate = UIImage(named: "icon-search")!.withRenderingMode(.alwaysTemplate)
        let leftView4 = imageViewWithIcon(searchGlassIconTemplate, rasterSize: rasterSize)
        searchBar = defaultSearchBar(withRasterSize: rasterSize,
                                      leftView: nil,
                                      rightView: nil,
                                      delegate: self)
        searchBar.textAlignment = .center
        searchBar.placeholder = "Search sports team or player..."
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(32)
            } else {
                make.top.equalTo(32)
            }
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(44)
        }
    }
}

extension HomeViewController: SHSearchBarDelegate {
    func searchBar(_ searchBar: SHSearchBar, textDidChange text: String) {
        print("text did change: \(text)")
    }
    
    func searchBarDidEndEditing(_ searchBar: SHSearchBar) {
        print("search bar end edit")
    }
    
    func searchBarShouldReturn(_ searchBar: SHSearchBar) -> Bool {
        guard let text = searchBar.text,
            !text.isEmpty else { return false }
        return true
    }
}

extension HomeViewController: ReactorKit.View {
    typealias Reactor = HomePageReactor
    
    func bind(reactor: Reactor) {
        
        reactor.state
            .map { $0.teamResult?.teams?.first }
            .distinctUntilChanged({ (leftTeam, rightTeam) -> Bool in
                return leftTeam?.idTeam == rightTeam?.idTeam
            })
            .filter { $0 != nil }
            .subscribe(onNext: { [weak self] (result) in
                self?.gotoSearchTeamResultPage(result: result!)
            })
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.playerResult?.player?.first }
            .distinctUntilChanged { (leftPlayer, rightPlayer) -> Bool in
                return leftPlayer?.idPlayer == rightPlayer?.idPlayer
            }
            .filter { $0 != nil }
            .subscribe(onNext: { [weak self] (player) in
                self?.gotoSearchPlayerResultPage(with: player!)
            })
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.loading }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (loading) in
                loading ? self?.loadingView.startAnimating() : self?.loadingView.stopAnimating()
            })
            .disposed(by: disposeBag)
            
    }
    
    func gotoSearchTeamResultPage(result: Team) {
        let detailPage = DetailViewController.instance(result: result)
        navigationController?.pushViewController(detailPage, animated: true)
    }
    
    func gotoSearchPlayerResultPage(with player: Player) {
        let playerPage = PlayerDetailViewController.instance(player: player)
        navigationController?.pushViewController(playerPage, animated: true)
    }
}

extension HomeViewController {
    // MARK: - Helper Functions
    func defaultSearchBar(withRasterSize rasterSize: CGFloat,
                          leftView: UIView?,
                          rightView: UIView?,
                          delegate: SHSearchBarDelegate,
                          useCancelButton: Bool = true) -> SHSearchBar {

        var config = defaultSearchBarConfig(rasterSize)
        config.leftView = leftView
        config.rightView = rightView
        config.useCancelButton = useCancelButton

        if leftView != nil {
            config.leftViewMode = .always
        }

        if rightView != nil {
            config.rightViewMode = .unlessEditing
        }

        let bar = SHSearchBar(config: config)
        bar.delegate = delegate
        bar.updateBackgroundImage(withRadius: 6, corners: [.allCorners], color: UIColor.white)
        bar.layer.shadowColor = UIColor.black.cgColor
        bar.layer.shadowOffset = CGSize(width: 0, height: 3)
        bar.layer.shadowRadius = 5
        bar.layer.shadowOpacity = 0.25
        return bar
    }

    func defaultSearchBarConfig(_ rasterSize: CGFloat) -> SHSearchBarConfig {
        var config: SHSearchBarConfig = SHSearchBarConfig()
        config.rasterSize = rasterSize
        config.cancelButtonTextAttributes = [.foregroundColor: UIColor.darkGray]
        config.textContentType = UITextContentType.name.rawValue
        config.textAttributes = [.foregroundColor: UIColor.darkGray]
        return config
    }
    
    func imageViewWithIcon(_ icon: UIImage, rasterSize: CGFloat) -> UIImageView {
        let imgView = UIImageView(image: icon)
        imgView.frame = CGRect(x: 0, y: 0, width: icon.size.width + rasterSize * 4.0, height: icon.size.height)
        imgView.contentMode = .center
        imgView.tintColor = UIColor(red: 0.75, green: 0, blue: 0, alpha: 1)
        return imgView
    }
}
