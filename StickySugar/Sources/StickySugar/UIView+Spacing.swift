//
//  UIView+Spacing.swift
//  StickySugar
//
//  Created by Mads Kleemann on 15/03/2020.
//

import UIKit

// MARK: Spacing views

// MARK: Verical
public func VFlexibleSpacing(_ minimumHeight: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
    return verticalFlexibleSpacing(minimumHeight, priority: priority)
}

public func verticalFlexibleSpacing(_ minimumHeight: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
    return verticalSpacing(minimumHeight, relation: .greaterThanOrEqual, priority: priority)
}

public func VSpacing(_ height: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    return verticalSpacing(height, relation: relation, priority: priority)
}

public func verticalSpacing(_ height: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    
    var c: NSLayoutConstraint!
    switch relation {
    case .equal:
        c = v.heightAnchor.constraint(equalToConstant: height)
    case .greaterThanOrEqual:
        c = v.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
    case .lessThanOrEqual:
        c = v.heightAnchor.constraint(lessThanOrEqualToConstant: height)
    @unknown default:
        assertionFailure()
    }
    c.priority = priority
    c.isActive = true
    
    return v
}

// MARK: Horizontal
 
public func HFlexibleSpacing(_ minimumWidth: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
    return horizontalFlexibleSpacing(minimumWidth, priority: priority)
}

public func horizontalFlexibleSpacing(_ minimumWidth: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
    return horizontalSpacing(minimumWidth, relation: .greaterThanOrEqual, priority: priority)
}

public func HSpacing(_ width: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    return horizontalSpacing(width, relation: relation, priority: priority)
}

public func horizontalSpacing(_ width: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> UIView {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    
    var c: NSLayoutConstraint!
    switch relation {
    case .equal:
        c = v.widthAnchor.constraint(equalToConstant: width)
    case .greaterThanOrEqual:
        c = v.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
    case .lessThanOrEqual:
        c = v.widthAnchor.constraint(lessThanOrEqualToConstant: width)
    @unknown default:
        assertionFailure()
    }
    c.priority = priority
    c.isActive = true
    
    return v
}

