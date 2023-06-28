//
//  Value+Extension.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/28.
//

import UIKit
import yoga

@MainActor
public extension Value {
    
    var yogaValue: YGValue {
        switch self.kind {
        case .narmal:
            return YGValue(value: Float(self.value), unit: self.yogaUnit)
        case .undefined:
            return YGValueUndefined
        case .automatic:
            return YGValueAuto
        }
    }
    
    init(yogaValue: YGValue) {
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
    
    fileprivate var yogaUnit: YGUnit {
        switch self.unit {
        case .point:
            return YGUnit.point
        case .percent:
            return YGUnit.percent
        }
    }
    
}
