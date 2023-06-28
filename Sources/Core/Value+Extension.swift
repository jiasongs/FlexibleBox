//
//  Value+Extension.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/28.
//

import UIKit

postfix operator %

extension IntegerLiteralType {
    
    @MainActor public static postfix func % (value: Self) -> Value {
        return Value(FloatLiteralType(value), unit: .percent)
    }
    
}

extension FloatLiteralType {
    
    @MainActor public static postfix func % (value: Self) -> Value {
        return Value(value, unit: .percent)
    }
    
}
