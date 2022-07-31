import UIKit

public class SingleSugarBuilder<ViewType>: SugarBuilder<ViewType> where ViewType: UIView {
 
    internal var lastSugar: NSLayoutConstraint
    
    init(_ view: ViewType, lastSugar: NSLayoutConstraint) {
        self.lastSugar = lastSugar
        lastSugar.isActive = true
        super.init(view)
    }
    
    @discardableResult
    public func configureConstraint(_ block: (NSLayoutConstraint) -> Void) -> SingleSugarBuilder<ViewType> {
        block(lastSugar)
        
        return self
    }
    
    @discardableResult
    public func assign(to: inout NSLayoutConstraint) -> SingleSugarBuilder<ViewType> {
        to = lastSugar
        
        return self
    }
    
    @discardableResult
    public func assign(to: inout NSLayoutConstraint?) -> SingleSugarBuilder<ViewType> {
        to = lastSugar
        
        return self
    }
    
    @discardableResult
    public func prioritize(_ priority: UILayoutPriority) -> SingleSugarBuilder<ViewType> {
        lastSugar.priority = priority
        
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
