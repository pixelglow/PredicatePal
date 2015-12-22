//
//  BinaryNumberExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum BinaryNumberFunction {
    case Add
    case Subtract
    case Multiply
    case Divide
    case Modulus
    case Power
    
    var tag: String {
        switch self {
        case .Add:
            return "add:to:"
        case .Subtract:
            return "from:subtract:"
        case .Multiply:
            return "multiply:by:"
        case .Divide:
            return "divide:by:"
        case .Modulus:
            return "modulus:by:"
        case .Power:
            return "raise:toPower:"
        }
    }
}

/// Number expression composing two number subexpressions.
/// - parameter E1: Full type of the LHS number subexpression.
/// - parameter E2: Full type of the RHS number subexpression.
public struct BinaryNumberExpression<E1: Expression, E2: Expression where E1.ExpressionType: NumberType, E1.ExpressionType == E2.ExpressionType>: Expression {
    public typealias ExpressionType = E1.ExpressionType
    
    let function: BinaryNumberFunction
    let leftSub: E1
    let rightSub: E2
}

/// Build the `NSExpression`.
public prefix func*<E1, E2>(expression: BinaryNumberExpression<E1, E2>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.leftSub, *expression.rightSub])
}

/// Add an expression to another expression.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func +<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Add, leftSub: leftSub, rightSub: rightSub)
}

/// Add an expression to a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func +<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Add, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Add a constant to an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func +<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Add, leftSub: Const(leftConst), rightSub: rightSub)
}

/// From an expression, subtract another expression.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func -<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Subtract, leftSub: leftSub, rightSub: rightSub)
}

/// From an expression, subtract a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func -<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Subtract, leftSub: leftSub, rightSub: Const(rightConst))
}

/// From a constant, subtract an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func -<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Subtract, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Multiply an expression by another expressions.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func *<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Multiply, leftSub: leftSub, rightSub: rightSub)
}

/// Multiply an expression by a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func *<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Multiply, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Mulitply a constant by an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func *<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Multiply, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Divide an expression by another expressions.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func /<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Divide, leftSub: leftSub, rightSub: rightSub)
}

/// Divide an expression by a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func /<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Divide, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Divide a constant by an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func /<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Divide, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Modulus an expression by another expressions.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func %<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Modulus, leftSub: leftSub, rightSub: rightSub)
}

/// Modulus an expression by a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func %<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Modulus, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Modulus a constant by an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func %<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Modulus, leftSub: Const(leftConst), rightSub: rightSub)
}

/// Raise an expression to the power of another expressions.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func **<E1, E2>(leftSub: E1, rightSub: E2) -> BinaryNumberExpression<E1, E2> {
    return BinaryNumberExpression(function: .Power, leftSub: leftSub, rightSub: rightSub)
}

/// Raise an expression to the power of a constant.
/// - parameter leftSub: The LHS number subexpression.
/// - parameter rightConst: The RHS number constant.
/// - returns: The resulting number expression.
public func **<E1>(leftSub: E1, rightConst: E1.ExpressionType) -> BinaryNumberExpression<E1, Const<E1.ExpressionType>> {
    return BinaryNumberExpression(function: .Power, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Raise a constant to the power of an expression.
/// - parameter leftConst: The LHS number constant.
/// - parameter rightSub: The RHS number subexpression.
/// - returns: The resulting number expression.
public func **<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryNumberExpression<Const<E2.ExpressionType>, E2> {
    return BinaryNumberExpression(function: .Power, leftSub: Const(leftConst), rightSub: rightSub)
}

