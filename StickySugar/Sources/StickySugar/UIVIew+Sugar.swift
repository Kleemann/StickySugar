//
//  UIVIew+Sugar.swift
//  StickySugar
//
//  Created by Mads Kleemann on 27/01/2019.
//

import UIKit

public protocol SugarView: class {}

extension UIView: SugarView {}

extension SugarView where Self: UIView {
    public var sugar: SugarBuilder<Self> {
        return SugarBuilder(self)
    }
}

extension UIView {
    public func addSubviews(_ subviews:[UIView]) {
        subviews.forEach { self.addSubview($0) }
    }
}
