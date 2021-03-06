//
//  SingleSugarBuilder.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

public class SingleSugarBuilder<ViewType: UIView>: SugarBuilder<ViewType> {
 
    internal var lastSugar: NSLayoutConstraint
    
    init(_ view: ViewType, lastSugar: NSLayoutConstraint) {
        self.lastSugar = lastSugar
        lastSugar.isActive = true
        super.init(view)
    }
    
    @discardableResult
    public func capture(_ block: (NSLayoutConstraint) -> Void) -> SingleSugarBuilder<ViewType> {
        block(lastSugar)
        
        return self
    }
    
    @discardableResult
    public func assign(to: inout NSLayoutConstraint) -> SingleSugarBuilder<ViewType> {
        to = lastSugar
        
        return self
    }
    
    @discardableResult
    public func prioritize(_ priority: UILayoutPriority) -> SingleSugarBuilder<ViewType> {
        lastSugar.priority = priority
        
        return self
    }

    @discardableResult
    public func huggingResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> SingleSugarBuilder<ViewType> {
        sugarView.setContentHuggingPriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func compressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> SingleSugarBuilder<ViewType> {
        sugarView.setContentCompressionResistancePriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func configure(_ configuration: @escaping (ViewType) -> Void) -> SingleSugarBuilder<ViewType> {
        configuration(sugarView)
        return self
    }
    
    @discardableResult
    public func relation(_ relation: NSLayoutConstraint.Relation) -> SingleSugarBuilder<ViewType> {
  
        guard let first = lastSugar.firstItem, let second = lastSugar.secondItem else {
            return self
        }
        
        let cnst = NSLayoutConstraint(item: first, attribute: lastSugar.firstAttribute, relatedBy: relation, toItem: second, attribute: lastSugar.secondAttribute, multiplier: lastSugar.multiplier, constant: lastSugar.multiplier)
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
}
