//
//  Layout.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit
import yoga

@MainActor
public final class Layout {
    
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
    
    public var marginLeft: Value {
        didSet {
            YGNodeStyleSetMargin(self.yogaNode, .left, self.marginLeft.yogaValue.value)
        }
    }
    
    public var width: Value = .automatic
    
    private static var isConfiguredYoga = false
    private static var yogaConfig: YGConfigRef = YGConfigGetDefault()
    
    private var yogaNode: YGNodeRef
    
    public init() {
        if !Self.isConfiguredYoga {
            Self.isConfiguredYoga = true
            Self.config = Self.config
        }
        
        self.yogaNode = YGNodeNewWithConfig(Self.yogaConfig)
        
        self.direction = Direction(yogaStyle: YGNodeStyleGetDirection(self.yogaNode))
        self.flexDirection = FlexDirection(yogaStyle: YGNodeStyleGetFlexDirection(self.yogaNode))
        
        self.marginLeft = Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .left))
    }
    
}

extension Layout {
    
    @discardableResult
    public func flexDirection(_ value: FlexDirection) -> Self {
        self.flexDirection = value
        return self
    }
    
    @discardableResult
    public func justifyContent(_ value: Justify) -> Self {
        self.justifyContent = value
        return self
    }
    
    @discardableResult
    public func marginLeft(_ value: Value) -> Self {
        self.marginLeft = value
        return self
    }
}

extension Layout {
    
    public func insert(_ child: Layout, at index: Int) {
        YGNodeInsertChild(self.yogaNode, child.yogaNode, UInt32(index))
    }
    
    public func remove(_ child: Layout) {
        YGNodeRemoveChild(self.yogaNode, child.yogaNode)
    }
    
    public func removeFromParent() {
        guard let yogaParentNode = YGNodeGetParent(self.yogaNode) else {
            return
        }
        YGNodeRemoveChild(yogaParentNode, self.yogaNode)
    }
    
}
