//
//  Array+Sugar.swift
//  FBSnapshotTestCase
//
//  Created by Mads Kleemann on 27/01/2019.
//

import UIKit

public extension Array where Element == NSLayoutConstraint {
    
    var top: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.top.rawValue
        })
    }
    
    var bottom: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.bottom.rawValue
        })
    }
    
    var leading: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.leading.rawValue
        })
    }
    
    var trailing: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.trailing.rawValue
        })
    }
    
    var centerX: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.centerX.rawValue
        })
    }
    
    var centerY: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.centerY.rawValue
        })
    }
    
    var width: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.width.rawValue
        })
    }
    
    var height: NSLayoutConstraint? {
        return first(where: {
            $0.identifier == ConstraintIdentifier.height.rawValue
        })
    }
}

internal extension Array where Element == NSLayoutConstraint {
    func activateAll() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivateAll() {
        NSLayoutConstraint.deactivate(self)
    }
}
