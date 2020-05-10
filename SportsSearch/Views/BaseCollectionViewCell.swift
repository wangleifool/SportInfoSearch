//
//  BaseCollectionView.swift
//  ShopChannel
//
//  Created by wanglei on 2019/3/1.
//  Copyright © 2019 liofty. All rights reserved.
//

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {
    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

extension BaseCollectionViewCell: NibIdentifiable {}
