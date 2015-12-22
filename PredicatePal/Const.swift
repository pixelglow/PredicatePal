//
//  Const.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Constant term.
/// - parameter T: The type of the constant.
public struct Const<T>: Expression {
    public typealias ExpressionType = T
    
    let value: T
    
    /// Create a constant term.
    /// - parameter value: The constant value.
    public init(_ value: T) {
        self.value = value
    }
}

/// Build the `NSExpression`.
public prefix func*<T>(expression: Const<T>) -> NSExpression {
    return NSExpression(forConstantValue:expression.value as? AnyObject)
}
