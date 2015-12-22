//
//  QuantifiedPredicate.swift
//  PredicatePal
//
//  Created by Glen Low on 8/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

enum Quantifier {
    case All
    case Any
    
    var tag: NSComparisonPredicateModifier {
        switch self {
        case .All:
            return .AllPredicateModifier
        case .Any:
            return .AnyPredicateModifier
        }
    }
}

/// Quantified predicate composing a comparison subpredicate.
/// - parameter E1: Full type of the LHS subexpression.
/// - parameter E2: Full type of the RHS subexpression.
public struct QuantifiedPredicate<E1: Expression, E2: Expression where E1.ExpressionType: CompareType, E1.ExpressionType == E2.ExpressionType>: Predicate {
    let quantifier: Quantifier
    let sub: ComparisonPredicate<E1, E2>
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }
}

/// Build the `NSPredicate`.
public prefix func*<E1, E2>(predicate: QuantifiedPredicate<E1, E2>) -> NSPredicate {
    return NSComparisonPredicate(
        leftExpression: *predicate.sub.leftSub,
        rightExpression: *predicate.sub.rightSub,
        modifier: predicate.quantifier.tag,
        type: predicate.sub.function.tag,
        options: NSComparisonPredicateOptions(rawValue: 0))
}

/// Whether a predicate holds for all elements.
/// - parameter sub: The subpredicate.
/// - returns: The resulting predicate.
public func all<E1, E2>(sub: ComparisonPredicate<E1, E2>) -> QuantifiedPredicate<E1, E2> {
    return QuantifiedPredicate(quantifier:.All, sub: sub)
}

/// Whether a predicate holds for any element.
/// - parameter sub: The subpredicate.
/// - returns: The resulting predicate.
public func any<E1, E2>(sub: ComparisonPredicate<E1, E2>) -> QuantifiedPredicate<E1, E2> {
    return QuantifiedPredicate(quantifier:.Any, sub: sub)
}

