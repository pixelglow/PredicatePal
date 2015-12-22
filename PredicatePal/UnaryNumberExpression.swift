//
//  UnaryNumberExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum UnaryNumberFunction {
    case Sqrt
    case Log
    case Ln
    case Exp
    case Floor
    case Ceil
    case Abs
    case Trunc
    
    var tag: String {
        switch self {
        case .Sqrt:
            return "sqrt:"
        case .Log:
            return "log:"
        case .Ln:
            return "ln:"
        case .Exp:
            return "exp:"
        case .Floor:
            return "floor:"
        case .Ceil:
            return "ceiling:"
        case .Abs:
            return "abs:"
        case .Trunc:
            return "trunc:"
        }
    }
}

/// Number expression composing a number subexpression.
/// - parameter E: Full type of the number subexpression.
public struct UnaryNumberExpression<E: Expression where E.ExpressionType: NumberType>: Expression {
    public typealias ExpressionType = E.ExpressionType
    
    let function: UnaryNumberFunction
    let sub: E
}

/// Build the `NSExpression`.
public prefix func*<E>(expression: UnaryNumberExpression<E>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.sub])
}

/// Square root of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func sqrt<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Sqrt, sub: sub)
}

/// Logarithm of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func log<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Log, sub: sub)
}

/// Logarithm of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func ln<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Ln, sub: sub)
}

/// Exponential of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func exp<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Exp, sub: sub)
}

/// Floor of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func floor<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Floor, sub: sub)
}

/// Ceiling of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func ceil<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Ceil, sub: sub)
}

/// Absolute value of an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func abs<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Abs, sub: sub)
}

/// Truncate an expression.
/// - parameter sub: The number subexpression.
/// - returns: The resulting number expression.
public func trunc<E>(sub: E) -> UnaryNumberExpression<E> {
    return UnaryNumberExpression(function: .Trunc, sub: sub)
}
