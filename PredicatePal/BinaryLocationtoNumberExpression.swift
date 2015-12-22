//
//  BinaryLocationtoNumberExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 19/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum BinaryLocationtoNumberFunction {
    case Distance
    
    var tag: String {
        switch self {
        case .Distance:
            return "distanceToLocation:fromLocation:"
        }
    }
}

/// Number expression composing two location subexpressions.
/// - parameter E1: Full type of the LHS location subexpression.
/// - parameter E2: Full type of the RHS location subexpression.
public struct BinaryLocationtoNumberFunctionExpression<E1: Expression, E2: Expression where E1.ExpressionType: LocationType, E1.ExpressionType == E2.ExpressionType>: Expression {
    public typealias ExpressionType = Double
    
    let function: BinaryLocationtoNumberFunction
    let leftSub: E1
    let rightSub: E2
}

/// Build the `NSExpression`.
public prefix func*<E1, E2>(expression: BinaryLocationtoNumberFunctionExpression<E1, E2>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.leftSub, *expression.rightSub])
}

/// Distance between two expressions.
/// - parameter leftSub: The LHS location subexpression.
/// - parameter rightSub: The RHS location subexpression.
/// - returns: The resulting number expression.
public func distance<E1, E2>(leftSub: E1, _ rightSub: E2) -> BinaryLocationtoNumberFunctionExpression<E1, E2> {
    return BinaryLocationtoNumberFunctionExpression(function: .Distance, leftSub: leftSub, rightSub: rightSub)
}

/// Distance between an expression and a constant.
/// - parameter leftSub: The LHS location subexpression.
/// - parameter rightConst: The RHS location constant.
/// - returns: The resulting number expression.
public func distance<E1>(leftSub: E1, _ rightConst: E1.ExpressionType) -> BinaryLocationtoNumberFunctionExpression<E1, Const<E1.ExpressionType>> {
    return BinaryLocationtoNumberFunctionExpression(function: .Distance, leftSub: leftSub, rightSub: Const(rightConst))
}

/// Distance between a constant and an expression.
/// - parameter leftConst: The LHS location constant.
/// - parameter rightSub: The RHS location subexpression.
/// - returns: The resulting number expression.
public func distance<E2>(leftConst: E2.ExpressionType, rightSub: E2) -> BinaryLocationtoNumberFunctionExpression<Const<E2.ExpressionType>, E2> {
    return BinaryLocationtoNumberFunctionExpression(function: .Distance, leftSub: Const(leftConst), rightSub: rightSub)
}
