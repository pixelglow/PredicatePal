//
//  This.swift
//  PredicatePal
//
//  Created by Glen Low on 18/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Evaluated object term.
/// - parameter T: The type of the evaluated object.
public struct This<T>: Expression {
    public typealias ExpressionType = T
    
    /// Create an evaluated object term.
    public init() { }
}

// Build the `NSExpression`.
public prefix func*<T>(expression: This<T>) -> NSExpression {
    return NSExpression.expressionForEvaluatedObject()
}
