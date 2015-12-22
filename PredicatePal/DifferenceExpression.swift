//
//  DifferenceExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Set difference expression composing a set subexpression and a sequence subexpression.
/// - parameter E1: Full type of the LHS number subexpression.
/// - parameter E2: Full type of the RHS number subexpression.
public struct DifferenceExpression<E1: Expression, E2: Expression where E1.ExpressionType: SetType, E2.ExpressionType: CollectionType, E1.ExpressionType.Element == E2.ExpressionType.Generator.Element>: Expression {
    public typealias ExpressionType = E1.ExpressionType
    
    let leftSub: E1
    let rightSub: E2
}

/// Build the `NSExpression`.
public prefix func*<E1, E2>(expression: DifferenceExpression<E1, E2>) -> NSExpression {
    return NSExpression(forMinusSet: *expression.leftSub, with: *expression.rightSub)
}

/// Difference an expression with another expression.
/// - parameter leftSub: The LHS set subexpression.
/// - parameter rightSub: The RHS sequence subexpression.
/// - returns: The resulting set expression.
public func -<E1: Expression, E2: Expression>(leftSub: E1, rightSub: E2) -> DifferenceExpression<E1, E2> {
    return DifferenceExpression(leftSub: leftSub, rightSub: rightSub)
}

/// Difference an expression with a constant.
/// - parameter leftSub: The LHS set subexpression.
/// - parameter rightConst: The RHS sequence constant.
/// - returns: The resulting set expression.
public func -<E1: Expression, C: SequenceType where E1.ExpressionType.Element == C.Generator.Element>(leftSub: E1, rightConst: C) -> DifferenceExpression<E1, Const<C>> {
    return DifferenceExpression(leftSub: leftSub, rightSub: Const(rightConst))
}

/// Difference a constant with an expression.
/// - parameter leftConst: The LHS set constant.
/// - parameter rightSub: The RHS sequence subexpression.
/// - returns: The resulting set expression.
public func -<E2: Expression, C: SetType where E2.ExpressionType.Generator.Element == C.Element>(leftConst: C, rightSub: E2) -> DifferenceExpression<Const<C>, E2> {
    return DifferenceExpression(leftSub: Const(leftConst), rightSub: rightSub)
}
