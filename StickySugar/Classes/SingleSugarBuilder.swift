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
        workingView.setContentHuggingPriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func compressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> SingleSugarBuilder<ViewType> {
        workingView.setContentCompressionResistancePriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func configure(_ configuration: @escaping (ViewType) -> Void) -> SingleSugarBuilder<ViewType> {
        configuration(workingView)
        return self
    }
}
