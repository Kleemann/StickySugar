//
//  UIView+ScrollSugar.swift
//  FBSnapshotTestCase
//
//  Created by Mads Kleemann on 03/02/2019.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func scrolling(_ direction: NSLayoutConstraint.Axis, views: [UIView], viewsLayout: @escaping () -> Void) -> UIScrollView {
        let scrollView = SugarScrollView(direction: direction)
        scrollView.isScrollEnabled = true
        
        scrollView.onLayoutSubviews = { s in
            
            views.forEach {
                s.containerView.addSubview($0)
            }
            
            viewsLayout()
        }
        
        addSubview(scrollView)
        
        return scrollView
    }
}


final private class SugarScrollView: UIScrollView {
    
    var onLayoutSubviews: ((SugarScrollView) -> Void)?
    let direction: NSLayoutConstraint.Axis
    let containerView: UIView
    private let actAsView: Bool
    
    init(direction: NSLayoutConstraint.Axis, actAsView: Bool = false) {
        self.direction = direction
        self.containerView = UIView()
        self.actAsView = actAsView
        super.init(frame: .zero)
        super.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Setting constrints via the builder dosn't properly sets the constrints to the scrollViews contentView.
        // We default to 'old' way.
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        switch direction {
        case .horizontal:
            containerView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        case .vertical:
            containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
        
        onLayoutSubviews?(self)
        // Only run the block once.
        onLayoutSubviews = nil
    }
    
    override func addSubview(_ view: UIView) {
        guard actAsView else {
            super.addSubview(view)
            return
        }
        
        containerView.addSubview(view)
    }
}
