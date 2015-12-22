//
//  ComparisonPredicate.swift
//  PredicatePal
//
//  Created by Glen Low on 8/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum ComparisonFunction {
    case Less
    case LessEqual
    case Greater
    case GreaterEqual
    case Equal
    case NotEqual
    
    var tag: NSPredicateOperatorType {
        switch self {
        case .Less:
            return .LessThanPredicateOperatorType
        case .LessEqual:
            return .LessThanOrEqualToPredicateOperatorType
        case .Greater:
            return .GreaterThanPredicateOperatorType
        case .GreaterEqual:
            return .GreaterThanOrEqualToPredicateOperatorType
        case .Equal:
            return .EqualToPredicateOperatorType
        case .NotEqual:
            return .NotEqualToPredicateOperatorType
        }
    }
}

/// Predicate composing two subexpressions.
/// - parameter E1: Full type of the LHS subexpression.
/// - parameter E2: Full type of the RHS subexpression.
public struct ComparisonPredicate<E1: Expression, E2: Expression where E1.ExpressionType: CompareType, E1.ExpressionType == E2.ExpressionType>: Predicate {
    let function: ComparisonFunction
    let leftSub: E1
    let rightSub: E2
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }
}

/// Builds the `NSPredicate`.
public prefix func*<E1, E2>(predicate: ComparisonPredicate<E1, E2>) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: *predicate.leftSub,
        rightExpression: *predicate.rightSub,
        modifier: .DirectPredicateModifier,
        type: predicate.function.tag,
        options: NSComparisonPredicateOptions(rawValue: 0))
}

/// Whether an expression is less than another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func <<E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .Less, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is less than a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func <<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .Less, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is less than an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func <<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .Less, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Whether an expression is less than or equal to another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func <=<E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .LessEqual, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is less than or equal to a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func <=<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .LessEqual, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is less than or equal to an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func <=<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .LessEqual, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Whether an expression is greater than another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func ><E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .Greater, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is greater than a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func ><E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .Greater, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is greater than an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func ><E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .Greater, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Whether an expression is greater than or equal to another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func >=<E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .GreaterEqual, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is greater than or equal to a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func >=<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .GreaterEqual, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is greater than or equal to an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func >=<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .GreaterEqual, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Whether an expression is equal to another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func ==<E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .Equal, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is equal to a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func ==<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .Equal, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is equal to an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func ==<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .Equal, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Whether an expression is not equal to another expression.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func !=<E1, E2>(leftSub: E1, rightSub: E2) -> ComparisonPredicate<E1, E2> {
    return ComparisonPredicate(function: .NotEqual, leftSub: leftSub, rightSub: rightSub)
}

/// Whether an expression is not equal to a constant.
/// - parameter leftSub: The LHS subexpression.
/// - parameter rightConst: The RHS constant.
/// - returns: The resulting predicate.
public func !=<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> ComparisonPredicate<E1, Const<E1.ExpressionType>> {
    return ComparisonPredicate(function: .NotEqual, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Whether a constant is not equal to an expression.
/// - parameter leftConst: The LHS constant.
/// - parameter rightSub: The RHS subexpression.
/// - returns: The resulting predicate.
public func !=<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> ComparisonPredicate<Const<E2.ExpressionType>, E2> {
    return ComparisonPredicate(function: .NotEqual, leftSub: Const(leftConst), rightSub: rightSub)
}
