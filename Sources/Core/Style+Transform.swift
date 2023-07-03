//
//  Style+Transform.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/21.
//

import UIKit
import yoga

public protocol StyleTransform {
    associatedtype YogaStyle
    
    var yogaStyle: YogaStyle { get }
    
    init(yogaStyle: YogaStyle)
}

extension Direction: StyleTransform {
    
    public var yogaStyle: YGDirection {
        switch self {
        case .inherit:
            return .inherit
        case .leftToRight:
            return .LTR
        case .rightToLeft:
            return .RTL
        }
    }
    
    public init(yogaStyle: YGDirection) {
        switch yogaStyle {
        case .inherit:
            self = .inherit
        case .LTR:
            self = .leftToRight
        case .RTL:
            self = .rightToLeft
        default:
            fatalError("unknown")
        }
    }
    
}

extension FlexDirection: StyleTransform {
    
    public var yogaStyle: YGFlexDirection {
        switch self {
        case .column:
            return .column
        case .columnReverse:
            return .columnReverse
        case .row:
            return .row
        case .rowReverse:
            return .rowReverse
        }
    }
    
    public init(yogaStyle: YGFlexDirection) {
        switch yogaStyle {
        case .column:
            self = .column
        case .columnReverse:
            self = .columnReverse
        case .row:
            self = .row
        case .rowReverse:
            self = .rowReverse
        default:
            fatalError("unknown")
        }
    }
    
}

extension Justify: StyleTransform {
    
    public var yogaStyle: YGJustify {
        switch self {
        case .flexStart:
            return .flexStart
        case .center:
            return .center
        case .flexEnd:
            return .flexEnd
        case .spaceBetween:
            return .spaceBetween
        case .spaceAround:
            return .spaceAround
        case .spaceEvenly:
            return .spaceEvenly
        }
    }
    
    public init(yogaStyle: YGJustify) {
        switch yogaStyle {
        case .flexStart:
            self = .flexStart
        case .center:
            self = .center
        case .flexEnd:
            self = .flexEnd
        case .spaceBetween:
            self = .spaceBetween
        case .spaceAround:
            self = .spaceAround
        case .spaceEvenly:
            self = .spaceEvenly
        default:
            fatalError("unknown")
        }
    }
    
}

extension Align: StyleTransform {
    
    public var yogaStyle: YGAlign {
        switch self {
        case .auto:
            return .auto
        case .flexStart:
            return .flexStart
        case .center:
            return .center
        case .flexEnd:
            return .flexEnd
        case .stretch:
            return .stretch
        case .baseline:
            return .baseline
        case .spaceBetween:
            return .spaceBetween
        case .spaceAround:
            return .spaceAround
        }
    }
    
    public init(yogaStyle: YGAlign) {
        switch yogaStyle {
        case .auto:
            self = .auto
        case .flexStart:
            self = .flexStart
        case .center:
            self = .center
        case .flexEnd:
            self = .flexEnd
        case .stretch:
            self = .stretch
        case .baseline:
            self = .baseline
        case .spaceBetween:
            self = .spaceBetween
        case .spaceAround:
            self = .spaceAround
        default:
            fatalError("unknown")
        }
    }
}

extension Position: StyleTransform {
    
    public var yogaStyle: YGPositionType {
        switch self {
        case .static:
            return .static
        case .relative:
            return .relative
        case .absolute:
            return .absolute
        }
    }
    
    public init(yogaStyle: YGPositionType) {
        switch yogaStyle {
        case .static:
            self = .static
        case .relative:
            self = .relative
        case .absolute:
            self = .absolute
        default:
            fatalError("unknown")
        }
    }
    
}

extension Wrap: StyleTransform {
    
    public var yogaStyle: YGWrap {
        switch self {
        case .none:
            return .noWrap
        case .wrap:
            return .wrap
        case .wrapReverse:
            return .wrapReverse
        }
    }
    
    public init(yogaStyle: YGWrap) {
        switch yogaStyle {
        case .noWrap:
            self = .none
        case .wrap:
            self = .wrap
        case .wrapReverse:
            self = .wrapReverse
        default:
            fatalError("unknown")
        }
    }
    
}

extension Overflow: StyleTransform {
    
    public var yogaStyle: YGOverflow {
        switch self {
        case .visible:
            return .visible
        case .hidden:
            return .hidden
        case .scroll:
            return .scroll
        }
    }
    
    public init(yogaStyle: YGOverflow) {
        switch yogaStyle {
        case .visible:
            self = .visible
        case .hidden:
            self = .hidden
        case .scroll:
            self = .scroll
        default:
            fatalError("unknown")
        }
    }
}

extension Display: StyleTransform {
    
    public var yogaStyle: YGDisplay {
        switch self {
        case .flex:
            return .flex
        case .none:
            return .none
        }
    }
    
    public init(yogaStyle: YGDisplay) {
        switch yogaStyle {
        case .flex:
            self = .flex
        case .none:
            self = .none
        default:
            fatalError("unknown")
        }
    }
}
