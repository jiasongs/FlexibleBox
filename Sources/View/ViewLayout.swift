//
//  ViewLayout.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/21.
//

import UIKit

public protocol ViewLayout: AnyObject {
    
}

extension UIView: ViewLayout {
    
}

extension CALayer: ViewLayout {
    
    
}

private struct AssociatedKeys {
    static var enabled = "flexbox_enabled"
    static var layout = "flexbox_layout"
}

@MainActor
extension FlexibleBoxWrapper where Base: ViewLayout {
    
    public var isEnabled: Bool {
        get {
            guard let enabled: NSNumber = getAssociatedObject(self.base, &AssociatedKeys.enabled) else {
                return false
            }
            return enabled.boolValue
        }
        set {
            setRetainedAssociatedObject(self.base, &AssociatedKeys.enabled, NSNumber(value: newValue))
            
            guard let layout: Layout = getAssociatedObject(self.base, &AssociatedKeys.layout) else {
                return
            }
            if newValue {
                
            } else {
                
            }
        }
    }
    
    public var layout: Layout {
        get {
            if let layout: Layout = getAssociatedObject(self.base, &AssociatedKeys.layout) {
                return layout
            }
            let layout = Layout()
            setRetainedAssociatedObject(self.base, &AssociatedKeys.layout, layout)
            return layout
        }
        set {
            setRetainedAssociatedObject(self.base, &AssociatedKeys.layout, newValue)
        }
    }
    
}
