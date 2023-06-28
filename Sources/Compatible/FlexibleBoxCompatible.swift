//
//  FlexibleBoxCompatible.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/21.
//

import UIKit

public struct FlexibleBoxWrapper<Base> {
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol FlexibleBoxCompatibleObject: AnyObject {}

extension FlexibleBoxCompatibleObject {
    
    public static var flexbox: FlexibleBoxWrapper<Self>.Type {
        get { FlexibleBoxWrapper<Self>.self }
        set { }
    }
    
    public var flexbox: FlexibleBoxWrapper<Self> {
        get { FlexibleBoxWrapper(self) }
        set { }
    }
    
}

extension UIView: FlexibleBoxCompatibleObject {}
extension CALayer: FlexibleBoxCompatibleObject {}
