//
//  Config.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit

public struct Config {
    
    public var pointScaleFactor: CGFloat
    
    public init(
        pointScaleFactor: CGFloat = UIScreen.main.scale
    ) {
        self.pointScaleFactor = pointScaleFactor
    }
    
}
