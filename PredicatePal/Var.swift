//
//  Var.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Variable term.
/// - parameter T: The type of the variable.
public struct Var<T>: Expression  {
    public typealias ExpressionType = T
    
    let name: String
    
    /// Create a variable term.
    /// - parameter name: The variable name.
    public init(_ name: String) {
        self.name = name
    }
}

/// Build the `NSExpression`.
public prefix func*<T>(expression: Var<T>) -> NSExpression {
    return NSExpression(forVariable: expression.name)
}

