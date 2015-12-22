//
//  TermTests.swift
//  PredicatePal
//
//  Created by Glen Low on 21/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import XCTest

import PredicatePal

class TermTests: XCTestCase {

    // AnyKey
    
    func testAnyKey() {
        let anyKey = AnyKey<Int>()
        
        XCTAssertEqual(
            *anyKey,
            NSExpression(format: "ANYKEY"))
    }
    
    // Block
    
    func testBlock() {
        let actualEvaluatedObject = "test"
        let actualBindings = ["a" : 1, "b" : 2]
        
        let predicate = *Block<String> { $0 == actualEvaluatedObject && ($1 as NSDictionary).isEqual(actualBindings as NSDictionary) }
        
        XCTAssertTrue(predicate.evaluateWithObject(actualEvaluatedObject, substitutionVariables: actualBindings))
    }

    // Boolean
    
    func testTrue() {
        XCTAssertEqual(
            *Boolean(true),
            NSPredicate(format: "TRUEPREDICATE"))
    }
    
    func testFalse() {
        XCTAssertEqual(
            *Boolean(false),
            NSPredicate(format: "FALSEPREDICATE"))
    }
    
    // Const
    
    func testConstInt() {
        XCTAssertEqual(
            *Const(42),
            NSExpression(format: "42"))
    }
    
    func testConstString() {
        XCTAssertEqual(
            *Const("hey"),
            NSExpression(format: "\"hey\""))
    }

    // Key
    
    func testKey() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *age,
            NSExpression(format: "age"))
    }
    
    // This
    
    func testThis() {
        let this = This<Int>()
        XCTAssertEqual(
            *this,
            NSExpression(format: "SELF"));
    }
    
    // Var
    
    func testVar() {
        let age = Var<Int>("age")
        XCTAssertEqual(
            *age,
            NSExpression(format: "$age"))
    }
}
