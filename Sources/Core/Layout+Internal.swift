//
//  Layout+Internal.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/7/3.
//

import UIKit
import yoga

extension Layout {
    
    func setYogaPosition(edge: YGEdge, yogaNode: YGNodeRef, yogaValue: YGValue) {
        switch yogaValue.unit {
        case .point, .undefined:
            YGNodeStyleSetPosition(yogaNode, edge, yogaValue.value)
        case .percent:
            YGNodeStyleSetPositionPercent(yogaNode, edge, yogaValue.value)
        case .auto:
            YGNodeStyleSetPosition(yogaNode, edge, yogaValue.value)
        default:
            fatalUnknownError()
        }
    }
    
    func setYogaMargin(edge: YGEdge, yogaNode: YGNodeRef, yogaValue: YGValue) {
        switch yogaValue.unit {
        case .point, .undefined:
            YGNodeStyleSetMargin(yogaNode, edge, yogaValue.value)
        case .percent:
            YGNodeStyleSetMarginPercent(yogaNode, edge, yogaValue.value)
        case .auto:
            YGNodeStyleSetMarginAuto(yogaNode, edge)
        default:
            fatalUnknownError()
        }
    }
    
    func setYogaPadding(edge: YGEdge, yogaNode: YGNodeRef, yogaValue: YGValue) {
        switch yogaValue.unit {
        case .point, .undefined:
            YGNodeStyleSetPadding(yogaNode, edge, yogaValue.value)
        case .percent:
            YGNodeStyleSetPaddingPercent(yogaNode, edge, yogaValue.value)
        case .auto:
            YGNodeStyleSetPadding(yogaNode, edge, yogaValue.value)
        default:
            fatalUnknownError()
        }
    }
    
}
