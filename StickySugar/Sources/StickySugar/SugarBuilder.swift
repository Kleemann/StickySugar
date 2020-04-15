//
//  SugarBuilder.swift
//  StickySugar
//
//  Created by Mads Kleemann on 26/01/2019.
//

import UIKit

public enum Edge: CaseIterable, Equatable {
    case top, trailing, bottom, leading
    
    public static var all: [Edge] {
        return Edge.allCases
    }
    
    public static func allExcept(_ edges: Edge...) -> [Edge] {
        return Edge.all.filter {
            return !edges.contains($0)
        }
    }
}

public extension Array where Element == Edge {
    static var all: [Element] {
        return Edge.all
    }
    
    static func allExcept(_ edges: Element...) -> [Element] {
        return Edge.all.filter {
            return !edges.contains($0)
        }
    }
}

public enum Size {
    case height, width
}

internal enum ConstraintIdentifier: String {
    case top, bottom, leading, trailing, centerX, centerY, width, height
}

public class SugarBuilder<ViewType: UIView> {
    
    public let sugarView: ViewType
    
    init(_ view: ViewType) {
        self.sugarView = view
        makeLayoutable(sugarView)
    }
    
    private func makeLayoutable(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func superview() -> UIView {
        guard let superview = sugarView.superview else {
            fatalError("The view dont have a superview (yet). View: \(sugarView.self)")
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
                let cnst = sugarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.value.top)
                cnst.identifier = ConstraintIdentifier.top.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = sugarView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.value.top)
                cnst.identifier = ConstraintIdentifier.top.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.trailing) {
            if relativeToSafeArea, #available(iOS 11.0, *){
                let cnst = sugarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.value.right)
                cnst.identifier = ConstraintIdentifier.trailing.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = sugarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.value.right)
                cnst.identifier = ConstraintIdentifier.trailing.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.bottom) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = sugarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.value.bottom)
                cnst.identifier = ConstraintIdentifier.bottom.rawValue
                cnsts.append(cnst)
                
            } else {
                let cnst = sugarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.value.bottom)
                cnst.identifier = ConstraintIdentifier.bottom.rawValue
                cnsts.append(cnst)
            }
        }
        
        if edges.contains(.leading) {
            if relativeToSafeArea, #available(iOS 11.0, *) {
                let cnst = sugarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:insets.value.left)
                cnst.identifier = ConstraintIdentifier.leading.rawValue
                cnsts.append(cnst)
            } else {
                let cnst = sugarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.value.left)
                cnst.identifier = ConstraintIdentifier.leading.rawValue
                cnsts.append(cnst)
            }
        }
        
        return MultipleSugarBuilder(sugarView, lastSugar: cnsts)
    }
    
    private func stickToEdge(edge: Edge, ofView view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        let cnst: NSLayoutConstraint!
        switch edge {
        case .top:
            cnst = sugarView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -insets.value.bottom)
            cnst.identifier = ConstraintIdentifier.bottom.rawValue
        case .bottom:
            cnst = sugarView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.value.top)
            cnst.identifier = ConstraintIdentifier.top.rawValue
        case .leading:
            cnst = sugarView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -insets.value.right)
            cnst.identifier = ConstraintIdentifier.trailing.rawValue
        case .trailing:
            cnst = sugarView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.value.left)
            cnst.identifier = ConstraintIdentifier.leading.rawValue
        }
        
        return SingleSugarBuilder(sugarView, lastSugar: cnst)
    }
    
    @discardableResult
    public func stickTopToBottom(of view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .bottom, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickBottomToTop(of view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .top, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickLeadingToTrailing(of view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .trailing, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func stickTrailingToLeading(of view: UIView, insets: Insets = .zero) -> SingleSugarBuilder<ViewType> {
        return stickToEdge(edge: .leading, ofView: view, insets: insets)
    }
    
    @discardableResult
    public func huggingResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> SugarBuilder<ViewType> {
        sugarView.setContentHuggingPriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func compressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> SugarBuilder<ViewType> {
        sugarView.setContentCompressionResistancePriority(priority, for: axis)
        
        return self
    }
    
    @discardableResult
    public func configureView(_ configuration: @escaping (ViewType) -> Void) -> SugarBuilder<ViewType> {
        configuration(sugarView)
        return self
    }
}
