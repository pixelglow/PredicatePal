//
//  AnyKey.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Any key term.
/// - parameter T: The type of the key.
public struct AnyKey<T>: Expression {
    public typealias ExpressionType = T
    
    /// Create an any key term.
    public init() { }
}

/// Build the `NSExpression`.
public prefix func*<T>(expression: AnyKey<T>) -> NSExpression {
    return NSExpression.expressionForAnyKey()
}

