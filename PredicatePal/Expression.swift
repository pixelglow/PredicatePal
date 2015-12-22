//
//  Expression.swift
//  PredicatePal
//
//  Created by Glen Low on 1/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Arbitrary expression builder.
public protocol Expression {
    typealias ExpressionType
    
    prefix func*(expression: Self) -> NSExpression
}
