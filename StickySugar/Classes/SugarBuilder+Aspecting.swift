//
//  SugarBuilder+Aspecting.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

extension SugarBuilder {

    @discardableResult
    public func aspectWidthToHeight(_ ratio: Double = 1) -> SingleSugarBuilder<ViewType> {
        let cnst = sugarView.heightAnchor.constraint(equalTo: sugarView.widthAnchor, multiplier: CGFloat(1.0/ratio))
        cnst.identifier = ConstraintIdentifier.height.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
    
    @discardableResult
    public func aspectHeightToWidth(_ ratio: Double = 1) -> SingleSugarBuilder<ViewType> {
        let cnst = sugarView.widthAnchor.constraint(equalTo: sugarView.heightAnchor, multiplier: CGFloat(1.0/ratio))
        cnst.identifier = ConstraintIdentifier.width.rawValue
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
}

