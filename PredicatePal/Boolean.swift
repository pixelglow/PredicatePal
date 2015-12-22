//
//  Boolean.swift
//  PredicatePal
//
//  Created by Glen Low on 10/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

public struct Boolean: Predicate {
    let value: Bool
    
    public func andSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public func orSubpredicates() -> [NSPredicate] {
        return [*self]
    }
    
    public init(_ value: Bool) {
        self.value = value;
    }
}

public prefix func*(predicate: Boolean) -> NSPredicate {
    return NSPredicate(value: predicate.value)
}