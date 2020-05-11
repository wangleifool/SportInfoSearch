//
//  PlayerPhotoCollectionTableViewCell.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/10.
//  Copyright © 2020 wanglei. All rights reserved.
//

import UIKit
import FSPagerView

class PlayerPhotoCollectionTableViewCell: BaseTableViewCell {

    private var photoUrls: [String] = []
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.dataSource = self
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.transformer = FSPagerViewTransformer(type: .depth)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(with urls: [String]) {
        photoUrls = urls
        pagerView.reloadData()
    }
    
}

extension PlayerPhotoCollectionTableViewCell: FSPagerViewDataSource {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return photoUrls.count
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.SCCornerRadius = 4
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.imageView?.kf.setImage(with: URL(string: photoUrls[index]))
        return cell
    }
}
