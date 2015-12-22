//
//  UnarySequenceToNumberExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum UnarySequenceToNumberFunction {
    case Sum
    case Count
    case Min
    case Max
    case Average
    case Median
    case Mode
    case Stddev
    
    var tag: String {
        switch self {
        case .Sum:
            return "sum:"
        case .Count:
            return "count:"
        case .Min:
            return "min:"
        case .Max:
            return "max:"
        case .Average:
            return "average:"
        case .Median:
            return "median:"
        case .Mode:
            return "mode:"
        case .Stddev:
            return "stddev:"
        }
    }
}

/// Number expression composing a sequence subexpression.
/// - parameter E: Full type of the sequence subexpression.
public struct UnarySequenceToNumberExpression<E: Expression where E.ExpressionType: SequenceType, E.ExpressionType.Generator.Element: NumberType>: Expression {
    public typealias ExpressionType = E.ExpressionType.Generator.Element
    
    let function: UnarySequenceToNumberFunction
    let sub: E
}

/// Build the `NSExpression`.
public prefix func*<E>(expression: UnarySequenceToNumberExpression<E>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.sub])
}

/// Sum of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func sum<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Sum, sub: sub)
}

/// Count of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func count<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Count, sub: sub)
}

/// Minimum value of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func min<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Min, sub: sub)
}

/// Maximum value of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func max<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Max, sub: sub)
}

/// Average of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func average<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Average, sub: sub)
}

/// Median of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func median<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Median, sub: sub)
}

/// Mode of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func mode<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Mode, sub: sub)
}

/// Standard deviation of an expression.
/// - parameter sub: The sequence subexpression.
/// - returns: The resulting number expression.
public func stddev<E>(sub: E) -> UnarySequenceToNumberExpression<E> {
    return UnarySequenceToNumberExpression(function: .Stddev, sub: sub)
}
