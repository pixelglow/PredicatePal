//
//  AndPredicate.swift
//  PredicatePal
//
//  Created by Glen Low on 8/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// AND predicate composing two subpredicates.
/// - parameter P1: Full type of the LHS subpredicate.
/// - parameter P2: Full type of the RHS subpredicate.
public struct AndPredicate<P1: Predicate, P2: Predicate>: Predicate {
    let leftSub: P1
    let rightSub: P2
    
    public func andSubpredicates() -> [NSPredicate] {
        return leftSub.andSubpredicates() + rightSub.andSubpredicates()
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }
}

/// Build the `NSPredicate`.
public prefix func*<P1, P2>(predicate: AndPredicate<P1, P2>) -> NSPredicate {
    return NSCompoundPredicate(andPredicateWithSubpredicates: predicate.andSubpredicates())
}

/// Logical AND of two predicates.
/// - parameter leftSub: The LHS subpredicate.
/// - parameter rightSub: The RHS subpredicate.
/// - returns: The resulting predicate.
public func &&<P1: Predicate, P2: Predicate>(leftSub: P1, rightSub: P2) -> AndPredicate<P1, P2> {
    return AndPredicate(leftSub: leftSub, rightSub: rightSub)
}
