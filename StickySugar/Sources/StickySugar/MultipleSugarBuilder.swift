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
    public func configureConstraint(_ block: ([NSLayoutConstraint]) -> Void) -> MultipleSugarBuilder<ViewType> {
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
    public func relation(_ relation: NSLayoutConstraint.Relation) -> MultipleSugarBuilder<ViewType> {
        let lastAdded = lastSugar
        
        var cnsts = [NSLayoutConstraint]()
        
        lastAdded.forEach {
            guard let first = $0.firstItem, let second = $0.secondItem else {
                return
            }
            
            let cnst = NSLayoutConstraint(item: first, attribute: $0.firstAttribute, relatedBy: relation, toItem: second, attribute: $0.secondAttribute, multiplier: $0.multiplier, constant: $0.multiplier)
            cnsts.append(cnst)
        }

        return MultipleSugarBuilder(sugarView, lastSugar: cnsts)
    }
}
