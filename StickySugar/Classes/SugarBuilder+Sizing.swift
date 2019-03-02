//
//  SugarBuilder+Sizing.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

extension SugarBuilder {
    
    @discardableResult
    public func size(toWidth width: CGFloat, height: CGFloat) -> MultipleSugarBuilder<ViewType>  {
        let width = sugarView.widthAnchor.constraint(equalToConstant: width)
        width.identifier = ConstraintIdentifier.width.rawValue
        let height = sugarView.heightAnchor.constraint(equalToConstant: height)
        height.identifier = ConstraintIdentifier.height.rawValue
        
        return MultipleSugarBuilder(sugarView, lastSugar: [width, height])
    }
    
    @discardableResult
    public func size(toWidth width: CGFloat) -> SingleSugarBuilder<ViewType> {
        let constraint = sugarView.widthAnchor.constraint(equalToConstant: width)
        constraint.identifier = ConstraintIdentifier.width.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: constraint)
    }
    
    @discardableResult
    public func size(toHeight height: CGFloat) -> SingleSugarBuilder<ViewType> {
        let constraint = sugarView.heightAnchor.constraint(equalToConstant: height)
        constraint.identifier = ConstraintIdentifier.height.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: constraint)
    }
    
    @discardableResult
    public func sizeWidth(to view: UIView, size: Size = .width, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        var cnst: NSLayoutConstraint!
        switch size {
        case .height:
            cnst = sugarView.widthAnchor.constraint(equalTo: view.heightAnchor, constant: insets.value.top)
        case .width:
            cnst = sugarView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: insets.value.left)
        }
        cnst.identifier = ConstraintIdentifier.width.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
    
    @discardableResult
    public func sizeWidthToParent(insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return sizeWidth(to: superview(), size: .width, insets: insets)
    }
    
    @discardableResult
    public func sizeHeight(to view: UIView, size: Size = .height, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        var cnst: NSLayoutConstraint!
        switch size {
        case .height:
            cnst = sugarView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: insets.value.top)
        case .width:
            cnst = sugarView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: insets.value.top)
        }
        cnst.identifier = ConstraintIdentifier.height.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
    
    @discardableResult
    public func sizeHeightToParent(insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return sizeWidth(to: superview(), size: .height, insets: insets)
    }
}
