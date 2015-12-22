//
//  SetExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Set intersect expression composing a set subexpression and a sequence subexpression.
/// - parameter E1: Full type of the LHS set subexpression.
/// - parameter E2: Full type of the RHS sequence subexpression.
public struct IntersectExpression<E1: Expression, E2: Expression where E1.ExpressionType: SetType, E2.ExpressionType: CollectionType, E1.ExpressionType.Element == E2.ExpressionType.Generator.Element>: Expression {
    public typealias ExpressionType = E1.ExpressionType
    
    let leftSub: E1
    let rightSub: E2
}

/// Build the `NSExpression`.
public prefix func*<E1, E2>(expression: IntersectExpression<E1, E2>) -> NSExpression {
    return NSExpression(forIntersectSet: *expression.leftSub, with: *expression.rightSub)
}

/// Intersect an expression with another expression.
/// - parameter leftSub: The LHS set subexpression.
/// - parameter rightSub: The RHS sequence subexpression.
/// - returns: The resulting set expression.
public func &<E1: Expression, E2: Expression>(leftSub: E1, rightSub: E2) -> IntersectExpression<E1, E2> {
    return IntersectExpression(leftSub: leftSub, rightSub: rightSub)
}

/// Intersect an expression with a constant.
/// - parameter leftSub: The LHS set subexpression.
/// - parameter rightConst: The RHS sequence constant.
/// - returns: The resulting set expression.
public func &<E1: Expression, C: SequenceType where E1.ExpressionType.Element == C.Generator.Element>(leftSub: E1, rightConst: C) -> IntersectExpression<E1, Const<C>> {
    return IntersectExpression(leftSub: leftSub, rightSub: Const(rightConst))
}

/// Intersect a constant with an expression.
/// - parameter leftConst: The LHS set constant.
/// - parameter rightSub: The RHS sequence subexpression.
/// - returns: The resulting set expression.
public func &<E2: Expression, C: SetType where E2.ExpressionType.Generator.Element == C.Element>(leftConst: C, rightSub: E2) -> IntersectExpression<Const<C>, E2> {
    return IntersectExpression(leftSub: Const(leftConst), rightSub: rightSub)
}
