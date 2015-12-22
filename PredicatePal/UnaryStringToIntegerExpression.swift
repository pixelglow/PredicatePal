//
//  UnaryStringToIntegerExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum UnaryStringToIntegerFunction {
    case Length
    
    var tag: String {
        switch self {
        case .Length:
            return "length:"
        }
    }
}

/// Integer expression composing a string subexpression.
/// - parameter E: Full type of the string subexpression.
public struct UnaryStringToIntegerExpression<E: Expression where E.ExpressionType: StringType>: Expression {
    public typealias ExpressionType = Int
    
    let function: UnaryStringToIntegerFunction
    let sub: E
}

/// Builds the `NSExpression`.
public prefix func*<E>(expression: UnaryStringToIntegerExpression<E>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.sub])
}

/// Length of an expression.
/// - parameter sub: The string subexpression.
/// - returns: The resulting integer expression.
public func length<E>(sub: E) -> UnaryStringToIntegerExpression<E> {
    return UnaryStringToIntegerExpression(function: .Length, sub: sub)
}
