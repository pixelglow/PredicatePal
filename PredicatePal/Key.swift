//
//  Key.swift
//  PredicatePal
//
//  Created by Glen Low on 7/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Keypath term.
/// - parameter T: The type of the keypath value.
public struct Key<T>: Expression {
    public typealias ExpressionType = T
    
    let path: String
    
    /// Create a keypath term.
    /// - parameter path: The keypath.
    public init(_ path: String) {
        self.path = path
    }
}

/// Build the `NSExpression`.
public prefix func*<T>(expression: Key<T>) -> NSExpression {
    return NSExpression(forKeyPath: expression.path)
}
