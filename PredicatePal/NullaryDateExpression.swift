//
//  NullaryDateExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum NullaryDateFunction {
    case Now
    
    var tag: String {
        switch self {
        case .Now:
            return "now"
        }
    }
}

/// Date expression with no subexpressions.
public struct NullaryDateExpression: Expression {
    public typealias ExpressionType = NSDate
    
    let function: NullaryDateFunction
}

/// Build the `NSExpression`.
public prefix func*(expression: NullaryDateExpression) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [])
}

/// The current date.
public func now() -> NullaryDateExpression {
    return NullaryDateExpression(function: .Now)
}
