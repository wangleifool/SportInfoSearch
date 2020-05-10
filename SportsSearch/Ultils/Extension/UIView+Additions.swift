//
//  UIView+Additions.swift
//  ShopChannel
//
//  Created by wanglei on 2019/2/21.
//  Copyright © 2019 liofty. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var SCCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var SCBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            guard newValue > 0 else { return }
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var SCBorderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
