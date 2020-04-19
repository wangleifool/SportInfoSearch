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

class HomeViewController: BaseViewController {
    
    var rasterSize: CGFloat = 11.0
    
    var searchBar: SHSearchBar!

    private var apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reactor = HomePageReactor()
        configSearchBar()
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
        
        reactor?.action.onNext(.search(text))
        
        return true
    }
}

extension HomeViewController: ReactorKit.View {
    typealias Reactor = HomePageReactor
    
    func bind(reactor: Reactor) {
        
        reactor.state
            .map { $0.result }
            .filter { ($0?.teams?.count ?? 0) != 0 }
            .subscribe(onNext: { [weak self] (result) in
                print("I got search result \(result?.teams?.first?.idTeam)")
                self?.gotoSearchResultPage(result: result!)
            })
            .disposed(by: disposeBag)
            
    }
    
    func gotoSearchResultPage(result: TeamResult) {
        let detailPage = DetailViewController.instance(result: result)
        navigationController?.pushViewController(detailPage, animated: true)
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
