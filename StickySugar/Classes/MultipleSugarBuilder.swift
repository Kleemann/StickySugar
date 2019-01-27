//
//  SugarBuilder+Multiple.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

public class MultipleSugarBuilder<ViewType: UIView>: SugarBuilder<ViewType> {
    
    internal var lastSugar: [NSLayoutConstraint]
    
    init(_ view: ViewType, lastSugar: [NSLayoutConstraint]) {
        self.lastSugar = lastSugar
        lastSugar.activateAll()
        super.init(view)
    }
    
    @discardableResult
    public func capture(_ block: ([NSLayoutConstraint]) -> Void) -> MultipleSugarBuilder<ViewType> {
        block(lastSugar)
        
        return self
    }
    
    @discardableResult
    public func assign(to: inout [NSLayoutConstraint]) -> MultipleSugarBuilder<ViewType> {
        to = lastSugar
        
        return self
    }
    
    @discardableResult
    public func prioritize(_ priority: UILayoutPriority) -> MultipleSugarBuilder<ViewType> {
        lastSugar.forEach {
            $0.priority = priority
        }
        
        return self
    }
    
    @discardableResult
    public func huggingResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> MultipleSugarBuilder<ViewType> {
        workingView.setContentHuggingPriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func compressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> MultipleSugarBuilder<ViewType> {
        workingView.setContentCompressionResistancePriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func configure(_ configuration: @escaping (ViewType) -> Void) -> MultipleSugarBuilder<ViewType> {
        configuration(workingView)
        return self
    }
}
