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
    
    public static var config: Config {
        get {
            return Config(
                pointScaleFactor: CGFloat(YGConfigGetPointScaleFactor(Layout.yogaConfig))
            )
        }
        set {
            YGConfigSetPointScaleFactor(Layout.yogaConfig, Float(newValue.pointScaleFactor))
        }
    }
    
    public var direction: Direction {
        get {
            return Direction(yogaStyle: YGNodeStyleGetDirection(self.yogaNode))
        }
        set {
            YGNodeStyleSetDirection(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var flexDirection: FlexDirection {
        get {
            return FlexDirection(yogaStyle: YGNodeStyleGetFlexDirection(self.yogaNode))
        }
        set {
            YGNodeStyleSetFlexDirection(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var justifyContent: Justify {
        get {
            return Justify(yogaStyle: YGNodeStyleGetJustifyContent(self.yogaNode))
        }
        set {
            YGNodeStyleSetJustifyContent(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var alignContent: Align {
        get {
            return Align(yogaStyle: YGNodeStyleGetAlignContent(self.yogaNode))
        }
        set {
            YGNodeStyleSetAlignContent(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var alignItems: Align {
        get {
            return Align(yogaStyle: YGNodeStyleGetAlignItems(self.yogaNode))
        }
        set {
            YGNodeStyleSetAlignItems(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var alignSelf: Align {
        get {
            return Align(yogaStyle: YGNodeStyleGetAlignSelf(self.yogaNode))
        }
        set {
            YGNodeStyleSetAlignSelf(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var position: Position {
        get {
            return Position(yogaStyle: YGNodeStyleGetPositionType(self.yogaNode))
        }
        set {
            YGNodeStyleSetPositionType(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var flexWrap: Wrap {
        get {
            return Wrap(yogaStyle: YGNodeStyleGetFlexWrap(self.yogaNode))
        }
        set {
            YGNodeStyleSetFlexWrap(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var overflow: Overflow {
        get {
            return Overflow(yogaStyle: YGNodeStyleGetOverflow(self.yogaNode))
        }
        set {
            YGNodeStyleSetOverflow(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var display: Display {
        get {
            return Display(yogaStyle: YGNodeStyleGetDisplay(self.yogaNode))
        }
        set {
            YGNodeStyleSetDisplay(self.yogaNode, newValue.yogaStyle)
        }
    }
    
    public var flex: Value {
        get {
            return Value(YGNodeStyleGetFlex(self.yogaNode))
        }
        set {
            assert(newValue.unit != .percent, "percent not supported")
            
            let value = newValue.unit != .percent ? newValue.value : Value.undefined.value
            YGNodeStyleSetFlex(self.yogaNode, Float(value))
        }
    }
    
    public var flexGrow: Value {
        get {
            return Value(YGNodeStyleGetFlex(self.yogaNode))
        }
        set {
            assert(newValue.unit != .percent, "percent not supported")
            
            let value = newValue.unit != .percent ? newValue.value : Value.undefined.value
            YGNodeStyleSetFlexGrow(self.yogaNode, Float(value))
        }
    }
    
    public var flexShrink: Value {
        get {
            return Value(YGNodeStyleGetFlex(self.yogaNode))
        }
        set {
            assert(newValue.unit != .percent, "percent not supported")
            
            let value = newValue.unit != .percent ? newValue.value : Value.undefined.value
            YGNodeStyleSetFlexShrink(self.yogaNode, Float(value))
        }
    }
    
    public var flexBasis: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetFlexBasis(self.yogaNode))
        }
        set {
            let yogaValue = newValue.yogaValue
            switch yogaValue.unit {
            case .point, .undefined:
                YGNodeStyleSetFlexBasis(self.yogaNode, yogaValue.value)
            case .percent:
                YGNodeStyleSetFlexBasisPercent(self.yogaNode, yogaValue.value)
            case .auto:
                YGNodeStyleSetFlexBasisAuto(self.yogaNode)
            default:
                fatalUnknownError()
            }
        }
    }
    
    public var left: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .left))
        }
        set {
            Self.setYogaPosition(edge: .left, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var top: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .top))
        }
        set {
            Self.setYogaPosition(edge: .top, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var right: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .top))
        }
        set {
            Self.setYogaPosition(edge: .right, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var bottom: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .bottom))
        }
        set {
            Self.setYogaPosition(edge: .bottom, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var start: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .start))
        }
        set {
            Self.setYogaPosition(edge: .start, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var end: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetPosition(self.yogaNode, .end))
        }
        set {
            Self.setYogaPosition(edge: .end, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginLeft: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .left))
        }
        set {
            Self.setYogaMargin(edge: .left, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginTop: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .top))
        }
        set {
            Self.setYogaMargin(edge: .top, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginRight: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .right))
        }
        set {
            Self.setYogaMargin(edge: .right, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginBottom: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .bottom))
        }
        set {
            Self.setYogaMargin(edge: .bottom, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginStart: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .start))
        }
        set {
            Self.setYogaMargin(edge: .start, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginEnd: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .end))
        }
        set {
            Self.setYogaMargin(edge: .end, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginHorizontal: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .horizontal))
        }
        set {
            Self.setYogaMargin(edge: .horizontal, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
    
    public var marginVertical: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetMargin(self.yogaNode, .vertical))
        }
        set {
            Self.setYogaMargin(edge: .vertical, yogaNode: self.yogaNode, yogaValue: newValue.yogaValue)
        }
    }
   
    public var margin: ValueEdgeInsets {
        get {
            return ValueEdgeInsets(top: self.marginTop, left: self.marginLeft, bottom: self.marginBottom, right: self.marginRight)
        }
        set {
            self.marginTop = newValue.top
            self.marginLeft = newValue.left
            self.marginBottom = newValue.bottom
            self.marginRight = newValue.right
        }
    }
    
    public var width: Value {
        get {
            return Value(yogaValue: YGNodeStyleGetWidth(self.yogaNode))
        }
        set {
            let yogaValue = newValue.yogaValue
            switch yogaValue.unit {
            case .point, .undefined:
                YGNodeStyleSetWidth(self.yogaNode, yogaValue.value)
            case .percent:
                YGNodeStyleSetWidthPercent(self.yogaNode, yogaValue.value)
            case .auto:
                YGNodeStyleSetWidthAuto(self.yogaNode)
            default:
                fatalUnknownError()
            }
        }
    }
    
    private static let yogaConfig = YGConfigGetDefault()
    private let yogaNode: YGNodeRef
    
    public init() {
        self.yogaNode = YGNodeNewWithConfig(Layout.yogaConfig)
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
