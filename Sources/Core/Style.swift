//
//  Style.swift
//  FlexibleBox
//
//  Created by jiasong on 2023/6/20.
//

import UIKit

public enum Direction {
    case inherit
    case leftToRight
    case rightToLeft
}

public enum FlexDirection {
    case column
    case columnReverse
    case row
    case rowReverse
}

public enum Justify {
    case flexStart
    case center
    case flexEnd
    case spaceBetween
    case spaceAround
    case spaceEvenly
}

public enum Align {
    case auto
    case flexStart
    case center
    case flexEnd
    case stretch
    case baseline
    case YGAlignSpaceBetween
    case YGAlignSpaceAround
}

public enum PositionType {
    case `static`
    case relative
    case absolute
}
