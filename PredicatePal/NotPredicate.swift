//
//  NotPredicate.swift
//  PredicatePal
//
//  Created by Glen Low on 17/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// NOT predicate composing a subpredicate.
/// - parameter P: Full type of the subpredicate.
public struct NotPredicate<P: Predicate>: Predicate {
    let sub: P
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }
}

/// Build the `NSPredicate`.
public prefix func*<P>(predicate: NotPredicate<P>) -> NSPredicate {
    return NSCompoundPredicate(notPredicateWithSubpredicate: *predicate.sub)
}

/// Logical NOT of a predicate.
/// - parameter sub: The subpredicate.
/// - returns: The resulting predicate.
public prefix func !<P>(sub: P) -> NotPredicate<P> {
    return NotPredicate(sub: sub)
}
