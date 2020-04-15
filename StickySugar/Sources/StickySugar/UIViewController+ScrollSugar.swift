//
//  UIViewController+ScrollSugar.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

extension UIViewController {
    
    public func HScrolling(_ views: @escaping (UIView) -> UIView) -> UIScrollView {
        return view.HScrolling(views)
    }
    
    public func VScrolling(_ views: @escaping (UIView) -> UIView) -> UIScrollView {
        return view.VScrolling(views)
    }

    @discardableResult
    public func scrolling(_ direction: NSLayoutConstraint.Axis, views: [UIView], viewsLayout: @escaping () -> Void) -> UIScrollView {
        return view.scrolling(direction, views: views, viewsLayout: viewsLayout)
    }
}

