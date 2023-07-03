//
//  Value+Extension.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/28.
//

import UIKit
import yoga

@MainActor
extension Value {
    
    public var yogaUnit: YGUnit {
        switch self.unit {
        case .point:
            return .point
        case .percent:
            return .percent
        }
    }
    
    public var yogaValue: YGValue {
        switch self {
        case .zero:
            return YGValueZero
        case .undefined:
            return YGValueUndefined
        case .automatic:
            return YGValueAuto
        default:
            return YGValue(value: Float(self.value), unit: self.yogaUnit)
        }
    }
    
    public init(yogaValue: YGValue) {
        switch yogaValue.unit {
        case .point:
            self = Value(FloatLiteralType(yogaValue.value))
        case .percent:
            self = Value(FloatLiteralType(yogaValue.value), unit: .percent)
        case .undefined:
            self = .undefined
        case .auto:
            self = .automatic
        default:
            fatalError("unknown")
        }
    }
    
}
