//
//  SugarBuilder+Centering.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

extension SugarBuilder {
    
    @discardableResult
    public func centerInParent(axes: [NSLayoutConstraint.Axis] = [.horizontal, .vertical], offset: CGPoint = .zero) -> MultipleSugarBuilder<ViewType> {
        return center(to: superview(), axes: axes, offset: offset)
    }
    
    @discardableResult
    public func center(to view: UIView, axes: [NSLayoutConstraint.Axis] = [.horizontal, .vertical], offset: CGPoint = .zero) -> MultipleSugarBuilder<ViewType>  {
        var cnsts = [NSLayoutConstraint]()
        if axes.contains(.horizontal) {
            let cnst = workingView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x)
            cnst.identifier = ConstraintIdentifier.centerX.rawValue
            cnsts.append(cnst)
        }
        if axes.contains(.vertical) {
            let cnst = workingView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y)
            cnst.identifier = ConstraintIdentifier.centerY.rawValue
            cnsts.append(cnst)
        }
        
        return MultipleSugarBuilder(workingView, lastSugar: cnsts)
    }
}
