//
//  SugarBuilder+Aligning.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

extension SugarBuilder {
    
    @discardableResult
    public func align(to view: UIView, edges: [Edge], insets: Insets = .zero) -> MultipleSugarBuilder<ViewType> {
        var cnsts = [NSLayoutConstraint]()
        if edges.contains(.top) {
            let cnst = sugarView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.value.top)
            cnst.identifier = ConstraintIdentifier.top.rawValue
            cnsts.append(cnst)
        }
        if edges.contains(.bottom) {
            let cnst = sugarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.value.bottom)
            cnst.identifier = ConstraintIdentifier.bottom.rawValue
            cnsts.append(cnst)
        }
        if edges.contains(.leading) {
            let cnst = sugarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.value.left)
            cnst.identifier = ConstraintIdentifier.leading.rawValue
            cnsts.append(cnst)
        }
        if edges.contains(.trailing) {
            let cnst = sugarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.value.right)
            cnst.identifier = ConstraintIdentifier.trailing.rawValue
            cnsts.append(cnst)
        }
        
        return MultipleSugarBuilder(sugarView, lastSugar: cnsts)
    }
}
