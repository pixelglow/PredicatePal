//
//  PredicatePalicateTests.swift
//  PredicatePal
//
//  Created by Glen Low on 8/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import XCTest

import PredicatePal

class PredicateTests: XCTestCase {

    // AndPredicate
    
    func testAnd2() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age > 21 && age < 42),
            NSPredicate(format: "age > 21 AND age < 42"))
    }
    
    func testAnd3() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age > 21 && age < 42 && age == 30),
            NSPredicate(format: "age > 21 AND age < 42 AND age == 30"))
    }
    
 
     // ComparisonPredicate

    func testLess() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age < 42),
            NSPredicate(format: "age < 42"))
    }

    func testLessEqual() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age <= 42),
            NSPredicate(format: "age <= 42"))
    }

    func testGreater() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age > 42),
            NSPredicate(format: "age > 42"))
    }

    func testGreaterEqual() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age >= 42),
            NSPredicate(format: "age >= 42"))
    }
    
    func testEqual() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age == 42),
            NSPredicate(format: "age == 42"))
    }

    func testNotEqual() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age != 42),
            NSPredicate(format: "age != 42"))
    }
    
    func testLessDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age < now),
            NSPredicate(format: "age < %@", now))
    }

    func testLessEqualDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age <= now),
            NSPredicate(format: "age <= %@", now))
    }
    
    func testGreaterDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age > now),
            NSPredicate(format: "age > %@", now))
    }
    
    func testGreaterEqualDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age >= now),
            NSPredicate(format: "age >= %@", now))
    }
    
    func testEqualDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age == now),
            NSPredicate(format: "age == %@", now))
    }
    
    func testNotEqualDate() {
        let age = Key<NSDate>("age")
        let now = NSDate()
        XCTAssertEqual(
            *(age != now),
            NSPredicate(format: "age != %@", now))
    }
   
    // NotPredicate

    func testNot() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(!(age > 42)),
            NSPredicate(format: "!(age > 42)"))
    }
    
    // OrPredicate

    func testOr2() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age < 21 || age > 42),
            NSPredicate(format: "age < 21 OR age > 42"))
    }

    func testOr3() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age < 21 || age > 42 || age == 30),
            NSPredicate(format: "age < 21 OR age > 42 OR age == 30"))
    }

    // QuantifiedPredicate
    
    func testAll() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *all(age == 42),
            NSPredicate(format: "ALL age == 42"))
    }
    
    func testAny() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *any(age == 42),
            NSPredicate(format: "ANY age == 42"))
    }
}
