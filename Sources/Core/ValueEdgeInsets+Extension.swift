//
//  ValueEdgeInsets+Extension.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/9/20.
//

import UIKit

postfix operator %

extension IntegerLiteralType {
    
    @MainActor public static postfix func % (value: Self) -> ValueEdgeInsets {
        return ValueEdgeInsets(
            top: value%,
            left: value%,
            bottom: value%,
            right: value%
        )
    }
    
}

extension FloatLiteralType {
 
    @MainActor public static postfix func % (value: Self) -> ValueEdgeInsets {
        return ValueEdgeInsets(
            top: value%,
            left: value%,
            bottom: value%,
            right: value%
        )
    }
    
}
