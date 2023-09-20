//
//  Value.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/28.
//

import UIKit
import yoga

@MainActor
public struct Value {
    
    public enum Unit {
        case point
        case percent
    }
    
    private enum Kind {
        case narmal
        case automatic
        case undefined
    }
    
    public let value: FloatLiteralType
    public let unit: Value.Unit
    
    private let kind: Value.Kind
    
    public init(_ value: FloatLiteralType, unit: Value.Unit = .point) {
        self.value = value
        self.unit = unit
        self.kind = .narmal
    }
    
    internal init(_ value: Float, unit: Value.Unit = .point) {
        self.init(FloatLiteralType(value), unit: unit)
    }
    
    private init(kind: Value.Kind) {
        switch kind {
        case .narmal:
            self.value = FloatLiteralType(YGValueZero.value)
        case .automatic:
            self.value = FloatLiteralType(YGValueAuto.value)
        case .undefined:
            self.value = FloatLiteralType(YGValueUndefined.value)
        }
        self.kind = kind
        self.unit = .point
    }
}

public extension Value {
    
    static var zero: Value {
        return Value(kind: .narmal)
    }
    
    static var undefined: Value {
        return Value(kind: .undefined)
    }
    
    static var automatic: Value {
        return Value(kind: .automatic)
    }
    
}

extension Value: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = Value(FloatLiteralType(value))
    }
    
    public init(floatLiteral value: FloatLiteralType) {
        self = Value(value)
    }
    
}

extension Value: Hashable, Equatable, Comparable {
    
    public static func < (lhs: Value, rhs: Value) -> Bool {
        guard lhs.unit == rhs.unit && lhs.kind == rhs.kind else {
            return false
        }
        switch lhs.kind {
        case .narmal:
            if lhs.value.isNaN && rhs.value.isNaN {
                return false
            } else {
                return lhs.value < rhs.value
            }
        case .automatic:
            return false
        case .undefined:
            return false
        }
    }
    
    public static func > (lhs: Value, rhs: Value) -> Bool {
        guard lhs.unit == rhs.unit && lhs.kind == rhs.kind else {
            return false
        }
        switch lhs.kind {
        case .narmal:
            if lhs.value.isNaN && rhs.value.isNaN {
                return false
            } else {
                return lhs.value > rhs.value
            }
        case .automatic:
            return false
        case .undefined:
            return false
        }
    }
    
    public static func == (lhs: Value, rhs: Value) -> Bool {
        guard lhs.unit == rhs.unit && lhs.kind == rhs.kind else {
            return false
        }
        switch lhs.kind {
        case .narmal:
            if lhs.value.isNaN && rhs.value.isNaN {
                return true
            } else {
                return lhs.value == rhs.value
            }
        case .automatic:
            return true
        case .undefined:
            return true
        }
    }
    
}
