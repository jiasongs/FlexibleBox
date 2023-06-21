//
//  Layout.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit
import yoga

@MainActor public struct Layout {
    
    public static var config = Config() {
        didSet {
            YGConfigSetPointScaleFactor(Self.yogaConfig, Float(Self.config.pointScaleFactor))
        }
    }
    
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
    
    fileprivate static var isConfiguredYoga = false
    fileprivate static var yogaConfig: YGConfigRef = YGConfigGetDefault()
    
    fileprivate var yogaNode: YGNodeRef
    
    public init() {
        if !Self.isConfiguredYoga {
            Self.isConfiguredYoga = true
            Self.config = Self.config
        }
        
        self.yogaNode = YGNodeNewWithConfig(Self.yogaConfig)
        
        self.direction = Direction(yogaStyle: YGNodeStyleGetDirection(self.yogaNode))
        self.flexDirection = FlexDirection(yogaStyle: YGNodeStyleGetFlexDirection(self.yogaNode))
    }
    
}
