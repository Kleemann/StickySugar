//
//  ViewsBuildable.swift
//
//  Created by Mads Kleemann on 02/04/2020.
//  Copyright © 2020 Mads Kleemann. All rights reserved.
//

import UIKit

public protocol ViewsBuildable {
    func buildViews() -> [UIView]
}

extension Optional: ViewsBuildable where Wrapped: ViewsBuildable {
    public func buildViews() -> [UIView] {
        self?.buildViews() ?? []
    }
}
