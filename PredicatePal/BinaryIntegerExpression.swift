//
//  BinaryIntegerExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum BinaryIntegerFunction {
    case BitAnd
    case BitOr
    case BitXor
    case LeftShift
    case RightShift
    
    var tag: String {
        switch self {
        case .BitAnd:
            return "bitwiseAnd:with:"
        case .BitOr:
            return "bitwiseOr:with:"
        case .BitXor:
            return "bitwiseXor:with:"
        case .LeftShift:
            return "leftshift:by:"
        case .RightShift:
            return "rightshift:by:"
        }
    }
}

/// Integer expression composing two integer subexpressions.
/// - parameter E1: Full type of the LHS integer subexpression.
/// - parameter E2: Full type of the RHS integer subexpression.
public struct BinaryIntegerExpression<E1: Expression, E2: Expression where E1.ExpressionType: IntegerType, E1.ExpressionType == E2.ExpressionType>: Expression {
    public typealias ExpressionType = E1.ExpressionType
    
    let function: BinaryIntegerFunction
    let leftSub: E1
    let rightSub: E2
}

/// Build the `NSExpression`.
public prefix func*<E1, E2>(expression: BinaryIntegerExpression<E1, E2>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.leftSub, *expression.rightSub])
}

/// Bitwise AND of two expressions.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func &<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryIntegerExpression<E1, E2> {
    return BinaryIntegerExpression(function: .BitAnd, leftSub: leftSub, rightSub: rightSub)
}

/// Bitwise AND of an expression and a constant.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightConst: The RHS integer constant.
/// - returns: The resulting integer expression.
public func &<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryIntegerExpression<E1, Const<E1.ExpressionType>> {
    return BinaryIntegerExpression(function: .BitAnd, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Bitwise AND of a constant and an expression.
/// - parameter leftConst: The LHS integer constant.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func &<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryIntegerExpression<Const<E2.ExpressionType>, E2> {
    return BinaryIntegerExpression(function: .BitAnd, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Bitwise OR of two expressions.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func |<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryIntegerExpression<E1, E2> {
    return BinaryIntegerExpression(function: .BitOr, leftSub: leftSub, rightSub: rightSub)
}

/// Bitwise OR of an expression and a constant.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightConst: The RHS integer constant.
/// - returns: The resulting integer expression.
public func |<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryIntegerExpression<E1, Const<E1.ExpressionType>> {
    return BinaryIntegerExpression(function: .BitOr, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Bitwise OR of a constant and an expression.
/// - parameter leftConst: The LHS integer constant.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func |<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryIntegerExpression<Const<E2.ExpressionType>, E2> {
    return BinaryIntegerExpression(function: .BitOr, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Bitwise XOR of two expressions.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func ^<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryIntegerExpression<E1, E2> {
    return BinaryIntegerExpression(function: .BitXor, leftSub: leftSub, rightSub: rightSub)
}

/// Bitwise OR of an expression and a constant.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightConst: The RHS integer constant.
/// - returns: The resulting integer expression.
public func ^<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryIntegerExpression<E1, Const<E1.ExpressionType>> {
    return BinaryIntegerExpression(function: .BitXor, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Bitwise XOR of a constant and an expression.
/// - parameter leftConst: The LHS integer constant.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func ^<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryIntegerExpression<Const<E2.ExpressionType>, E2> {
    return BinaryIntegerExpression(function: .BitXor, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Left-shift an expression by another expression.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func <<<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryIntegerExpression<E1, E2> {
    return BinaryIntegerExpression(function: .LeftShift, leftSub: leftSub, rightSub: rightSub)
}

/// Left-shift an expression by a constant.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightConst: The RHS integer constant.
/// - returns: The resulting integer expression.
public func <<<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryIntegerExpression<E1, Const<E1.ExpressionType>> {
    return BinaryIntegerExpression(function: .LeftShift, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Left-shift a constant by an expression.
/// - parameter leftConst: The LHS integer constant.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func <<<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryIntegerExpression<Const<E2.ExpressionType>, E2> {
    return BinaryIntegerExpression(function: .LeftShift, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Right-shift an expression by another expression.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func >><E1, E2>(leftSub: E1, rightSub: E2) -> BinaryIntegerExpression<E1, E2> {
    return BinaryIntegerExpression(function: .RightShift, leftSub: leftSub, rightSub: rightSub)
}

/// Right-shift an expression by a constant.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightConst: The RHS integer constant.
/// - returns: The resulting integer expression.
public func >><E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryIntegerExpression<E1, Const<E1.ExpressionType>> {
    return BinaryIntegerExpression(function: .RightShift, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Right-shift an expression by another expression.
/// - parameter leftSub: The LHS integer subexpression.
/// - parameter rightSub: The RHS integer subexpression.
/// - returns: The resulting integer expression.
public func >><E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryIntegerExpression<Const<E2.ExpressionType>, E2> {
    return BinaryIntegerExpression(function: .RightShift, leftSub: Const(leftConst), rightSub: rightSub)
}
