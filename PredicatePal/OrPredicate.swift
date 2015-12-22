//
//  OrPredicate.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// OR predicate composing two subpredicates.
/// - parameter P1: Full type of the LHS subpredicate.
/// - parameter P2: Full type of the RHS subpredicate.
public struct OrPredicate<P1: Predicate, P2: Predicate>: Predicate {
    let leftSub: P1
    let rightSub: P2
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return leftSub.orSubpredicates() + rightSub.orSubpredicates()
    }
}

/// Build the `NSPredicate`.
public prefix func*<P1, P2>(predicate: OrPredicate<P1, P2>) -> NSPredicate {
    return NSCompoundPredicate(orPredicateWithSubpredicates: predicate.orSubpredicates())
}

/// Logical OR of two predicates.
/// - parameter leftSub: The LHS subpredicate.
/// - parameter rightSub: The RHS subpredicate.
/// - returns: The resulting predicate.
public func ||<P1, P2>(leftSub: P1, rightSub: P2) -> OrPredicate<P1, P2> {
    return OrPredicate(leftSub: leftSub, rightSub: rightSub)
}
