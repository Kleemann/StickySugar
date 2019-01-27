//
//  UIVIew+Sugar.swift
//  FBSnapshotTestCase
//
//  Created by Mads Kleemann on 27/01/2019.
//

import UIKit

extension UIView {
    public func addSubviews(_ subviews:[UIView]) {
        subviews.forEach { self.addSubview($0) }
    }
}
