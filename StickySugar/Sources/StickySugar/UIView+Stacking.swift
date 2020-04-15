//
//  UIView+Stacking.swift
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
    
    @discardableResult
    public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func VSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func VSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func HSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func HSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
    }
}

// Convience for also calling stacking methods from a viewController
extension UIViewController {
    @discardableResult
    public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: [UIView], viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return view.stack(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
       
    @discardableResult
    public func VSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func VSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func HSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
    }
    
    @discardableResult
    public func HSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
        return stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
    }
}

//// Convience for also calling stacking methods from a UICollectionViewCell (adding to contentView)
//
//extension UICollectionViewCell {
//    @discardableResult
//       public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: [UIView], viewsLayout: (() -> Void)? = nil) -> UIStackView {
//           return contentView.stack(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
//       }
//
//       @discardableResult
//       public func stack(_ axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
//           return contentView.stack(axis, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
//       }
//
//       @discardableResult
//       public func VSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
//           return contentView.stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
//       }
//
//       @discardableResult
//       public func VSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
//           return contentView.stack(.vertical, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
//       }
//
//       @discardableResult
//       public func HSugarStack(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: UIView..., viewsLayout: (() -> Void)? = nil) -> UIStackView {
//           return contentView.stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views, viewsLayout: viewsLayout)
//       }
//
//       @discardableResult
//       public func HSugarStack<V: ViewsBuildable>(spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, _ views: () -> V, viewsLayout: (() -> Void)? = nil) -> UIStackView {
//        return contentView.stack(.horizontal, spacing: spacing, distribution: distribution, alignment: alignment, views: views().buildViews(), viewsLayout: viewsLayout)
//       }
//}

