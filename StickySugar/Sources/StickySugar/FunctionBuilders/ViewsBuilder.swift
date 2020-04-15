//
//  ViewsBuilder.swift
//  CollectionViewCompositionalLayout-Playground
//
//  Created by Mads Kleemann on 02/04/2020.
//  Copyright © 2020 Mads Kleemann. All rights reserved.
//

import UIKit

@_functionBuilder
public struct ViewsBuilder: ViewsBuildable {
    internal var views: [UIView]
    
    public func buildViews() -> [UIView] {
        views
    }
    
    public static func buildBlock() -> ViewsBuilder {
        ViewsBuilder()
    }
    
    public static func buildBlock<V: ViewsBuildable>(_ v: V) -> ViewsBuilder {
        ViewsBuilder(v)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable>(_ v0: V0, _ v1: V1) -> ViewsBuilder {
        ViewsBuilder(v0, v1)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4, _ v5: V5) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4, v5)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4, _ v5: V5, _ v6: V6) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4, v5, v6)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4, _ v5: V5, _ v6: V6, _ v7: V7) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4, v5, v6, v7)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable, V8: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4, v5, v6, v7, v8)
    }

    public static func buildBlock<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable, V8: ViewsBuildable, V9: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ c4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9) -> ViewsBuilder {
        ViewsBuilder(v0, v1, v2, v3, c4, v5, v6, v7, v8, v9)
    }
}


internal extension ViewsBuilder {
    init() {
        views = []
    }
    
    @usableFromInline
    init<V: ViewsBuildable>(_ v: V) {
        views = v.buildViews()
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable>(_ v0: V0, _ v1: V1) {
        views = v0.buildViews() + v1.buildViews()
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2) {
        views = v0.buildViews() + v1.buildViews() + v2.buildViews()
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews()
        views = views0 + views1
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews()
        views = views0 + views1
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews() + v5.buildViews()
        views = views0 + views1
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews() + v5.buildViews()
        let views2 = v6.buildViews()
        views = views0 + views1 + views2
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews() + v5.buildViews()
        let views2 = v6.buildViews() + v7.buildViews()
        views = views0 + views1 + views2
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable, V8: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews() + v5.buildViews()
        let views2 = v6.buildViews() + v7.buildViews() + v8.buildViews()
        views = views0 + views1 + views2
    }

    @usableFromInline
    init<V0: ViewsBuildable, V1: ViewsBuildable, V2: ViewsBuildable, V3: ViewsBuildable, V4: ViewsBuildable, V5: ViewsBuildable, V6: ViewsBuildable, V7: ViewsBuildable, V8: ViewsBuildable, V9: ViewsBuildable>(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3, _ v4: V4, _ v5: V5, _ v6: V6, _ v7: V7, _ v8: V8, _ v9: V9) {
        let views0 = v0.buildViews() + v1.buildViews() + v2.buildViews()
        let views1 = v3.buildViews() + v4.buildViews() + v5.buildViews()
        let views2 = v6.buildViews() + v7.buildViews() + v8.buildViews()
        views = views0 + views1 + views2 + v9.buildViews()
    }
}


extension SugarBuilder: ViewsBuildable {
    public func buildViews() -> [UIView] {
        return [sugarView]
    }
}

extension UIView: ViewsBuildable {
    public func buildViews() -> [UIView] {
        return [self]
    }
}
