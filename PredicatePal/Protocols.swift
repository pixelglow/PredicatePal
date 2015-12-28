//
//  NumberType.swift
//  PredicatePal
//
//  Created by Glen Low on 1/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import Foundation
import CoreLocation

public protocol CompareType { }
public protocol LocationType { }
public protocol IntegerType { }
public protocol NumberType { }
public protocol StringType { }

public protocol IndexType {
    typealias Key
    typealias Value
}

public protocol SetType {
    typealias Element
}

extension Int: NumberType, IntegerType, CompareType { }
extension Int8: NumberType, IntegerType, CompareType { }
extension Int16: NumberType, IntegerType, CompareType { }
extension Int32: NumberType, IntegerType, CompareType { }
extension Int64: NumberType, IntegerType, CompareType { }

extension UInt: NumberType, IntegerType, CompareType { }
extension UInt8: NumberType, IntegerType, CompareType { }
extension UInt16: NumberType, IntegerType, CompareType { }
extension UInt32: NumberType, IntegerType, CompareType { }
extension UInt64: NumberType, IntegerType, CompareType { }

extension Float: NumberType, CompareType { }
extension Double: NumberType, CompareType { }

extension String: StringType, CompareType { }

extension Array: IndexType {
    public typealias Key = Int
    public typealias Value = Element
}

extension Dictionary: IndexType { }

extension Set: SetType { }

extension CLLocation: LocationType { }

extension NSDate: CompareType { }
