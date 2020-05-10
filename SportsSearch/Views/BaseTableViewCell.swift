//
//  BaseTableViewCell.swift
//  ShopChannel
//
//  Created by lio on 2019/1/11.
//  Copyright © 2019 liofty. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell, UITextFieldDelegate {

    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension BaseTableViewCell: NibIdentifiable {}
