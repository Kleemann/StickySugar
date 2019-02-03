//
//  UIView+StackSugar.swift
//  StickySugar
//
//  Created by Mads Kleemann on 03/02/2019.
//

import UIKit

extension UIView {
    @discardableResult
    public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: [UIView], viewsLayout: (() -> Void)? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        addSubview(stackView)
        
        views.forEach {
            // Incase somebody already added the view to a view - remove it.
            $0.removeFromSuperview()
            stackView.addArrangedSubview($0)
        }
        
        viewsLayout?()
        
        return stackView
    }
}
