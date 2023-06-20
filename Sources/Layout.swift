//
//  Layout.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit
import yoga

@MainActor public final class Layout {
    
    public var direction: Direction = .inherit {
        didSet {
            
        }
    }
    
    private var node: YGNodeRef
   
    public init(config: Config = Config.default) {
        let yogaConfig = YGConfigNew()
        YGConfigSetPointScaleFactor(yogaConfig, Float(config.pointScaleFactor))
        self.node = YGNodeNewWithConfig(yogaConfig)
    }
    
}
