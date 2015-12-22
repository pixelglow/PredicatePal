//
//  SubqueryExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 12/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Subquery expression composing a sequence subexpression, an iterator variable and a predicate.
/// - parameter E: Full type of the sequence subexpression.
/// - parameter P: Full type of the predicate to filter the sequence.
public struct SubqueryExpression<E: Expression, P: Predicate where E.ExpressionType: SequenceType>: Expression {
    public typealias ExpressionType = E.ExpressionType
    
    let subquery: E
    let iterator: Var<E.ExpressionType.Generator.Element>
    let predicate: P
}

/// Build the `NSExpression`.
public prefix func*<E: Expression, P: Predicate>(expression: SubqueryExpression<E, P>) -> NSExpression {
    return NSExpression(forSubquery: *expression.subquery, usingIteratorVariable: expression.iterator.name, predicate: *expression.predicate)
}

/// Filters a sequence expression by a predicate.
/// - parameter subquery: The sequence expression.
/// - parameter iterator: The iterator variable.
/// - parameter predicate: The predicate using `iterator` to filter `subquery`.
/// - returns: The resulting sequence expression.
public func subquery<E: Expression, P: Predicate where E.ExpressionType: SequenceType>(subquery: E, iterator: Var<E.ExpressionType.Generator.Element>, predicate: P) -> SubqueryExpression<E, P> {
    return SubqueryExpression(subquery: subquery, iterator: iterator, predicate: predicate)
}