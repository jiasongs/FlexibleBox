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
    case spaceBetween
    case spaceAround
}

public enum Position {
    case `static`
    case relative
    case absolute
}

public enum Wrap {
    case none
    case wrap
    case wrapReverse
}

public enum Overflow {
    case visible
    case hidden
    case scroll
}

public enum Display {
    case flex
    case none
}
