//
//  NullaryIntegerExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum NullaryIntegerFunction {
    case Random
    
    var tag: String {
        switch self {
        case .Random:
            return "random"
        }
    }
}

/// Integer expression with no subexpressions.
public struct NullaryIntegerExpression: Expression {
    public typealias ExpressionType = Int
    
    let function: NullaryIntegerFunction
}

/// Builds an `NSExpression`
public prefix func*(expression: NullaryIntegerExpression) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [])
}

/// A random integer.
public func random() -> NullaryIntegerExpression {
    return NullaryIntegerExpression(function: .Random)
}
