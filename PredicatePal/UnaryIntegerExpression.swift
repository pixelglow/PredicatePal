//
//  UnaryIntegerExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum UnaryIntegerFunction {
    case RandomN
    case Complement
    
    var tag: String {
        switch self {
        case .RandomN:
            return "randomn:"
        case .Complement:
            return "onesComplement:"
        }
    }
}

/// Integer expression composing an integer subexpression.
/// - parameter E: Full type of the integer subexpression.
public struct UnaryIntegerExpression<E: Expression where E.ExpressionType: IntegerType>: Expression {
    public typealias ExpressionType = E.ExpressionType
    
    let function: UnaryIntegerFunction
    let sub: E
}

/// Build the `NSExpression`.
public prefix func*<E>(expression: UnaryIntegerExpression<E>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.sub])
}

/// A random integer bounded by an expression.
/// - parameter sub: The integer subexpression.
/// - returns: The resulting integer expression.
public func randomn<E>(sub: E) -> UnaryIntegerExpression<E> {
    return UnaryIntegerExpression(function: .RandomN, sub: sub)
}

/// Complement an expression.
/// - parameter sub: The integer subexpression.
/// - returns: The resulting integer expression.
prefix public func ~<E>(sub: E) -> UnaryIntegerExpression<E> {
    return UnaryIntegerExpression(function: .Complement, sub: sub)
}
