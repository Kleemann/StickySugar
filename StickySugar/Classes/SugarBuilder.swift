//
//  SugarBuilder.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

public enum Edge: CaseIterable {
    case top, trailing, bottom, leading
}

public enum Size {
    case height, width
}

internal enum ConstraintIdentifier: String {
    case top, bottom, leading, trailing, centerX, centerY, width, height
}

public class SugarBuilder<ViewType: UIView> {
    
    let workingView: ViewType
    
    init(_ view: ViewType) {
        self.workingView = view
        makeLayoutable(workingView)
    }
    
    private func makeLayoutable(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func superview() -> UIView {
        guard let superview = workingView.superview else {
            fatalError("The view dont have a superview (yet). View: \(workingView.self)")
        }
        
        return superview
    }
    
    // MARK: Sticking
    
    @discardableResult
    public func stickToParentEdges(edges: [Edge] = Edge.allCases, insets: Insets = .zero, relativeToSafeArea: Bool = true) -> MultipleSugarBuilder<ViewType> {
        return stickToEdges(of: superview(), edges: edges, insets: insets, relativeToSafeArea: relativeToSafeArea)
    }
    
    @discardableResult
    public func stickToEdges(of view: UIView, edges: [Edge] = Edge.allCases, insets: Insets = .zero, relativeToSafeArea: Bool = true) -> MultipleSugarBuilder<ViewType> {
        var cnsts = [NSLayoutConstraint]()
        if edges.contains(.top) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = workingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.value.top)
                cnst.identifier = ConstraintIdentifier.top.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = workingView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.value.top)
                cnst.identifier = ConstraintIdentifier.top.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.trailing) {
            if relativeToSafeArea, #available(iOS 11.0, *){
                let cnst = workingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.value.right)
                cnst.identifier = ConstraintIdentifier.trailing.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = workingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.value.right)
                cnst.identifier = ConstraintIdentifier.trailing.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.bottom) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = workingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.value.bottom)
                cnst.identifier = ConstraintIdentifier.bottom.rawValue
                cnsts.append(cnst)
                
            } else {
                let cnst = workingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.value.bottom)
                cnst.identifier = ConstraintIdentifier.bottom.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.leading) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = workingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:insets.value.left)
                cnst.identifier = ConstraintIdentifier.leading.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = workingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.value.left)
                cnst.identifier = ConstraintIdentifier.leading.rawValue
                cnsts.append(cnst)
            }
        }
        
        return MultipleSugarBuilder(workingView, lastSugar: cnsts)
    }
    
    private func stickToEdge(edge: Edge, ofView view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        let cnst: NSLayoutConstraint!
        switch edge {
        case .top:
            cnst = workingView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -insets.value.bottom)
            cnst.identifier = ConstraintIdentifier.bottom.rawValue
        case .bottom:
            cnst = workingView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.value.top)
            cnst.identifier = ConstraintIdentifier.top.rawValue
        case .leading:
            cnst = workingView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -insets.value.right)
            cnst.identifier = ConstraintIdentifier.trailing.rawValue
        case .trailing:
            cnst = workingView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.value.left)
            cnst.identifier = ConstraintIdentifier.leading.rawValue
        }
        
        return SingleSugarBuilder(workingView, lastSugar: cnst)
    }
    
    @discardableResult
    public func stickTopToBottom(of view: UIView, insets: Insets) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .bottom, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickBottomToTop(of view: UIView, insets: Insets) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .top, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickLeadingToTrailing(of view: UIView, insets: Insets) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .trailing, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickTrailingToLeading(of view: UIView, insets: Insets) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .leading, ofView: view, insets: insets)
    }
}
