//
//  PredicatePalicate.swift
//  PredicatePal
//
//  Created by Glen Low on 1/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation

/// Arbitrary predicate builder.
public protocol Predicate {
    func andSubpredicates() -> [NSPredicate]
    func orSubpredicates() -> [NSPredicate]
    
    prefix func*(predicate: Self) -> NSPredicate
}
