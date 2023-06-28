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
                return getAssociatedObject(self.base, &AssociatedKeys.layout) != nil
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

#if swift(>=5.4)
@resultBuilder
public struct StackBuilder {
  public static func buildBlock(_ stacks: Stack...) -> [Stack] {
    return stacks
  }
}
#else
@_functionBuilder
public struct StackBuilder {
  public static func buildBlock(_ stack: Stack...) -> [Stack] {
    return stacks
  }
}
#endif

public protocol Stack {
    
}

extension UIView: Stack {
    public func makeStacks(@StackBuilder content: () -> [Stack]) -> Self {
        return self
    }
}

public struct VerticalStack: Stack {
    
    public init(@StackBuilder content: () -> [Stack]) {
        
    }
    
}

public struct HorizontalStack: Stack {
    
    public init(@StackBuilder content: () -> [Stack]) {
        
    }
    
}
