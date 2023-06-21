//
//  Style+Private.swift
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
            self = .inherit
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
        @unknown default:
            self = .column
        }
    }
    
}
