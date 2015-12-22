//
//  BinaryIndexExpression.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum BinaryIndexFunction {
    case Index
    
    var tag: String {
        switch self {
        case .Index:
            return "objectFrom:withIndex:"
        }
    }
}

/// Value expression composing an indexable subexpression and a key expression.
/// - parameter E1: Full type of the LHS indexable subexpression.
/// - parameter E2: Full type of the RHS key subexpression.
public struct BinaryIndexExpression<E1: Expression, E2: Expression where E1.ExpressionType: IndexType, E1.ExpressionType.Key == E2.ExpressionType>: Expression {
    public typealias ExpressionType = E1.ExpressionType.Value
    
    let function: BinaryIndexFunction
    let leftSub: E1
    let rightSub: E2
}

/// Builds the `NSExpression`.
public prefix func*<E1, E2>(expression: BinaryIndexExpression<E1, E2>) -> NSExpression {
    return NSExpression(forFunction: expression.function.tag, arguments: [*expression.leftSub, *expression.rightSub])
}

public extension Expression where ExpressionType: IndexType {
    /// Index an expression with a constant.
    /// - parameter index: The RHS key constant.
    /// - returns: The resulting value expression.
    subscript(index: Self.ExpressionType.Key) -> BinaryIndexExpression<Self, Const<Self.ExpressionType.Key>> {
        return BinaryIndexExpression(function: .Index, leftSub: self, rightSub: Const(index))
    }
}
