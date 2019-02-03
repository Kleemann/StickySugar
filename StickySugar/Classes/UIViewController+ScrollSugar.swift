//
//  UIViewController+ScrollSugar.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

extension UIViewController {

    @discardableResult
    public func scrolling(_ direction: NSLayoutConstraint.Axis, views: [UIView], viewsLayout: @escaping () -> Void) -> UIScrollView {
        return view.scrolling(direction, views: views, viewsLayout: viewsLayout)
    }
}

