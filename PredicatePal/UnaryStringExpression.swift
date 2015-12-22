//
//  UnaryStringExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum UnaryStringFunction {
    case Uppercase
    case Lowercase
    
    var tag: String {
        switch self {
        case .Uppercase:
            return "uppercase:"
        case .Lowercase:
            return "lowercase:"
        }
    }
}

/// String expression composing a string subexpression.
/// - parameter E: Full type of the string subexpression.
public struct UnaryStringExpression<E: Expression where E.ExpressionType: StringType>: Expression {
    public typealias ExpressionType = E.ExpressionType
    
    let function: UnaryStringFunction
    let sub: E
}

/// Build the `NSExpression`.
public prefix func*<E>(expression: UnaryStringExpression<E>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.sub])
}

/// Uppercase the expression.
/// - parameter sub: The string subexpression.
/// - returns: The resulting string expression.
public func uppercase<E>(sub: E) -> UnaryStringExpression<E> {
    return UnaryStringExpression(function: .Uppercase, sub: sub)
}

/// Lowercase the expression.
/// - parameter sub: The string subexpression.
/// - returns: The resulting string expression.
public func lowercase<E>(sub: E) -> UnaryStringExpression<E> {
    return UnaryStringExpression(function: .Lowercase, sub: sub)
}
