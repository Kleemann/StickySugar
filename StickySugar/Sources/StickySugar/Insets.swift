import UIKit
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
    
    public static func top(_ top: CGFloat) -> Insets {
        return .init(top: top, left: 0, bottom: 0, right: 0)
    }
    
    public static func bottom(_ bottom: CGFloat) -> Insets {
        return .init(top: 0, left: 0, bottom: bottom, right: 0)
    }
    
    public static func left(_ left: CGFloat) -> Insets {
        return .init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    public static func right(_ right: CGFloat) -> Insets {
        return .init(top: 0, left: 0, bottom: 0, right: right)
    }
}
