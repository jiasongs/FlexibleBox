//
//  ValueEdgeInsets.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/9/20.
//

import UIKit

@MainActor
public struct ValueEdgeInsets {
    
    public var top: Value
    
    public var left: Value
    
    public var bottom: Value
    
    public var right: Value
    
    public init(top: Value, left: Value, bottom: Value, right: Value) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
}

public extension ValueEdgeInsets {
    
    static var zero: ValueEdgeInsets {
        return ValueEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
    }
    
    static var undefined: ValueEdgeInsets {
        return ValueEdgeInsets(top: .undefined, left: .undefined, bottom: .undefined, right: .undefined)
    }
    
    static var automatic: ValueEdgeInsets {
        return ValueEdgeInsets(top: .automatic, left: .automatic, bottom: .automatic, right: .automatic)
    }
    
}

extension ValueEdgeInsets: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = ValueEdgeInsets(
            top: Value(FloatLiteralType(value)),
            left: Value(FloatLiteralType(value)),
            bottom: Value(FloatLiteralType(value)),
            right: Value(FloatLiteralType(value))
        )
    }
    
    public init(floatLiteral value: FloatLiteralType) {
        self = ValueEdgeInsets(
            top: Value(value),
            left: Value(value),
            bottom: Value(value),
            right: Value(value)
        )
    }
    
}

extension ValueEdgeInsets: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.top == rhs.top && lhs.left == rhs.left && lhs.bottom == rhs.bottom && lhs.right == rhs.right
    }
}
