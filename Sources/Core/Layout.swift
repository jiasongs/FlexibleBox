//
//  Layout.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit
import yoga

@MainActor public final class Layout {
    
    public var direction: Direction {
        didSet {
            YGNodeStyleSetDirection(self.yogaNode, self.direction.yogaStyle)
        }
    }
    
    public var flexDirection: FlexDirection {
        didSet {
            YGNodeStyleSetFlexDirection(self.yogaNode, self.flexDirection.yogaStyle)
        }
    }
    
    public var justifyContent: Justify = .flexStart
    public var alignContent: Align = .auto
    public var alignItems: Align = .auto
    public var alignSelf: Align = .auto
    
    fileprivate var yogaNode: YGNodeRef
    fileprivate var yogaConfig: YGConfigRef
    
    public init(config: Config = Config.default) {
        self.yogaConfig = YGConfigNew()
        YGConfigSetPointScaleFactor(self.yogaConfig, Float(config.pointScaleFactor))
        
        self.yogaNode = YGNodeNewWithConfig(self.yogaConfig)
        
        self.direction = Direction(yogaStyle: YGNodeStyleGetDirection(self.yogaNode))
        self.flexDirection = FlexDirection(yogaStyle: YGNodeStyleGetFlexDirection(self.yogaNode))
    }
    
}
