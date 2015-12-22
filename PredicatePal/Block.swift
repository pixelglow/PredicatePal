//
//  Block.swift
//  PredicatePal
//
//  Created by Glen Low on 18/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// This is a block
public struct Block<T>: Predicate {
    let block: (AnyObject, [String: AnyObject]?) -> Bool
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }

    public init(_ block: (T, [String: AnyObject]) -> Bool) {
        self.block = { block($0 as! T, $1 ?? [:]) }
    }
}

public prefix func*<T>(predicate: Block<T>) -> NSPredicate {
    return NSPredicate(block: predicate.block)
}

