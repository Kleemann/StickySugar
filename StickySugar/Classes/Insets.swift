//
//  Insets.swift
//  Cheftography
//
//  Created by Mads Kleemann on 20/10/2018.
//

import Foundation

public struct Insets: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public let value: UIEdgeInsets
    
    public static let zero = Insets(floatLiteral: 0)
    
    public init(floatLiteral value: Float) {
        self.init(top:  CGFloat(value), left:  CGFloat(value), bottom:  CGFloat(value), right:  CGFloat(value))
    }
    
    public init(integerLiteral value: Int) {
        self.init(top:  CGFloat(value), left:  CGFloat(value), bottom:  CGFloat(value), right:  CGFloat(value))
    }
    
    public init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        value = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
