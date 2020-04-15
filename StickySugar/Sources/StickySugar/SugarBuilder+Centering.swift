//
//  SugarBuilder+Centering.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit
import Foundation

extension SugarBuilder {
    
    @discardableResult
    public func centerInParent(axes: [NSLayoutConstraint.Axis] = [.horizontal, .vertical], offset: CGPoint = .zero, relativeToSafeArea: Bool = true) -> MultipleSugarBuilder<ViewType> {
        return center(to: superview(), axes: axes, offset: offset, relativeToSafeArea: relativeToSafeArea)
    }
    
    @discardableResult
    public func center(to view: UIView, axes: [NSLayoutConstraint.Axis] = [.horizontal, .vertical], offset: CGPoint = .zero, relativeToSafeArea: Bool = true) -> MultipleSugarBuilder<ViewType>  {
        var cnsts = [NSLayoutConstraint]()
        if axes.contains(.horizontal) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = sugarView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: offset.x)
                cnst.identifier = ConstraintIdentifier.centerX.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = sugarView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x)
                cnst.identifier = ConstraintIdentifier.centerX.rawValue
                cnsts.append(cnst)
            }
        }
        if axes.contains(.vertical) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = sugarView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: offset.y)
                cnst.identifier = ConstraintIdentifier.centerY.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = sugarView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y)
                cnst.identifier = ConstraintIdentifier.centerY.rawValue
                cnsts.append(cnst)
            }
           
        }
        
        return MultipleSugarBuilder(sugarView, lastSugar: cnsts)
    }
}
