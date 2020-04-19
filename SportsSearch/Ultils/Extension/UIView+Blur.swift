//
//  UIView+Blur.swift
//  SportsSearch
//
//  Created by Shi Li on 2020/4/19.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation
//import UIKit
//
//
//protocol Blurable {
//    var layer: CALayer { get }
//    var subviews: [UIView] { get }
//    var frame: CGRect { get }
//    var superview: UIView? { get }
//
//    func addSubview(view: UIView)
//    func removeFromSuperview()
//
//    func blur(blurRadius: CGFloat)
//    func unBlur()
//
//    var isBlurred: Bool { get }
//}
//
//extension Blurable {
//    func blur(blurRadius: CGFloat) {
//        if self.superview == nil {
//            return
//        }
//
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1)
//
//        layer.render(in: UIGraphicsGetCurrentContext()!)
//
//        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
//
//        UIGraphicsEndImageContext();
//
//        guard let blur = CIFilter(name: "CIGaussianBlur"),
//            let this = self as? UIView else { return }
//
//        blur.setValue(CIImage(image: image), forKey: kCIInputImageKey)
//        blur.setValue(blurRadius, forKey: kCIInputRadiusKey)
//
//        let ciContext  = CIContext(options: nil)
//
//        guard let result = blur.value(forKey: kCIOutputImageKey) as? CIImage else { return }
//
//        let boundingRect = CGRect(x:0,
//            y: 0,
//            width: frame.width,
//            height: frame.height)
//
//        guard let cgImage = ciContext.createCGImage(result, from: boundingRect) else { return }
//
//        let filteredImage = UIImage(cgImage: cgImage)
//
//        let blurOverlay = BlurOverlay()
//        blurOverlay.frame = boundingRect
//
//        blurOverlay.image = filteredImage
//        blurOverlay.contentMode = UIView.ContentMode.left
//
//        if let superview = superview as? UIStackView,
//            let index = (superview as UIStackView).arrangedSubviews.indexOf(this) {
//            removeFromSuperview()
//            superview.insertArrangedSubview(blurOverlay, atIndex: index)
//        } else {
//            blurOverlay.frame.origin = frame.origin
//
//            UIView.transition(from: this,
//                              to: blurOverlay,
//                              duration: 0.2,
//                              options: UIView.AnimationOptions.curveEaseIn,
//                              completion: nil)
//        }
//
//        objc_setAssociatedObject(this,
//            &BlurableKey.blurable,
//            blurOverlay,
//            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//    }
//
//    func unBlur() {
//        guard let this = self as? UIView,
//            let blurOverlay = objc_getAssociatedObject(self as? UIView, &BlurableKey.blurable) as? BlurOverlay else
//        {
//            return
//        }
//
//        if let superview = blurOverlay.superview as? UIStackView,
//            index = (blurOverlay.superview as! UIStackView).arrangedSubviews.indexOf(blurOverlay)
//        {
//            blurOverlay.removeFromSuperview()
//            superview.insertArrangedSubview(this, atIndex: index)
//        }
//        else
//        {
//            this.frame.origin = blurOverlay.frame.origin
//
//            UIView.transitionFromView(blurOverlay,
//                toView: this,
//                duration: 0.2,
//                options: UIViewAnimationOptions.CurveEaseIn,
//                completion: nil)
//        }
//
//        objc_setAssociatedObject(this,
//            &BlurableKey.blurable,
//            nil,
//            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//    }
//
//    var isBlurred: Bool
//    {
//        return objc_getAssociatedObject(self as? UIView, &BlurableKey.blurable) is BlurOverlay
//    }
//}
//
//extension UIView: Blurable
//{
//}
//
//class BlurOverlay: UIImageView
//{
//}
//
//struct BlurableKey
//{
//    static var blurable = "blurable"
//}

import UIKit

protocol Blurable {
    var layer: CALayer { get }
    var subviews: [UIView] { get }
    var frame: CGRect { get }
    var superview: UIView? { get }
    
    func add(subview: UIView)
    func removeFromSuperview()
    
    func blur(radius: CGFloat)
    func unBlur()
    
    var isBlurred: Bool { get }
}

extension Blurable {
    func blur(radius: CGFloat) {
        if self.superview == nil {
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        layer.render(in: context)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
  
        UIGraphicsEndImageContext();
        
        guard let blur = CIFilter(name: "CIGaussianBlur"),
            let this = self as? UIView else {
            return
        }
  
        blur.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        blur.setValue(radius, forKey: kCIInputRadiusKey)
        
        let ciContext  = CIContext(options: nil)
        
        guard let result = blur.value(forKey: kCIOutputImageKey) as? CIImage else { return }
        
        let boundingRect = CGRect(x:0,
            y: 0,
            width: frame.width,
            height: frame.height)
        
        guard let cgImage = ciContext.createCGImage(result, from: boundingRect) else { return }

        let filteredImage = UIImage(cgImage: cgImage)
        
        let blurOverlay = BlurOverlay()
        blurOverlay.frame = boundingRect
        
        blurOverlay.image = filteredImage
        blurOverlay.contentMode = UIView.ContentMode.left
     
        if let superview = superview as? UIStackView,
            let index = (superview as UIStackView).arrangedSubviews.firstIndex(of: this) {
            removeFromSuperview()
            superview.insertArrangedSubview(blurOverlay, at: index)
        } else {
            blurOverlay.frame.origin = frame.origin
            
            UIView.transition(from: this,
                              to: blurOverlay,
                duration: 0.2,
                options: UIView.AnimationOptions.curveEaseIn,
                completion: nil)
        }
        
        objc_setAssociatedObject(this,
            &BlurableKey.blurable,
            blurOverlay,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func unBlur() {
        guard let this = self as? UIView,
            let blurOverlay = objc_getAssociatedObject(self as? UIView ?? UIView(), &BlurableKey.blurable) as? BlurOverlay else {
            return
        }
        
        if let superview = blurOverlay.superview as? UIStackView,
            let index = (blurOverlay.superview as? UIStackView)?.arrangedSubviews.firstIndex(of: blurOverlay) {
            blurOverlay.removeFromSuperview()
            superview.insertArrangedSubview(this, at: index)
        } else {
            this.frame.origin = blurOverlay.frame.origin
            
            UIView.transition(from: blurOverlay,
                              to: this,
                duration: 0.2,
                options: UIView.AnimationOptions.curveEaseIn,
                completion: nil)
        }
        
        objc_setAssociatedObject(this,
            &BlurableKey.blurable,
            nil,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    var isBlurred: Bool
    {
        return objc_getAssociatedObject(self as? UIView ?? UIView(), &BlurableKey.blurable) is BlurOverlay
    }
}

extension UIView: Blurable {
    func add(subview: UIView) {
        self.addSubview(subview)
    }
    
}

class BlurOverlay: UIImageView {
}

struct BlurableKey {
    static var blurable = "blurable"
}
