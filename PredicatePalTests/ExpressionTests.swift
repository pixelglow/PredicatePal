//
//  ExpressionTests.swift
//  PredicatePal
//
//  Created by Glen Low on 4/12/2015.
//  Copyright © 2015 Glen Low. All rights reserved.
//

import CoreLocation
import XCTest

import PredicatePal

class ExpressionTests: XCTestCase {

    // BinaryIndexExpression
    
    func testArrayIndex() {
        let age = Key<[Int]>("age")
        
        XCTAssertEqual(
            *age[1],
            NSExpression(format: "age[1]"))
    }
    
    func testDictionaryIndex() {
        let age = Key<Dictionary<String, Int>>("age")
        XCTAssertEqual(
            *age["one"],
            NSExpression(format: "age[\"one\"]"))
    }
    
    // BinaryIntegerExpression
    
    func testBitAnd() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age & 42),
            NSExpression(format: "age & 42"))
    }

    func testBitOr() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age | 42),
            NSExpression(format: "age | 42"))
    }

    func testBitXor() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age ^ 42),
            NSExpression(format: "age ^ 42"))
    }
    
    func testLeftShift() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age << 4),
            NSExpression(format: "age << 4"))
    }

    func testRightShift() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(age >> 4),
            NSExpression(format: "age >> 4"))
    }
    
    // BinaryLocationToNumberExpression
    
    func testDistance() {
        let age = Key<CLLocation>("age")
        let beauty = Key<CLLocation>("beauty")
        XCTAssertEqual(
            *(age - beauty),
            NSExpression(format: "distanceToLocation:fromLocation:(age, beauty)"))
    }
    
    // BinaryNumberExpression

    func testAdd() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age + 42),
            NSExpression(format: "age + 42"))
    }

    func testSubtract() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age - 42),
            NSExpression(format: "age - 42"))
    }

    func testMultiply() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age * 42),
            NSExpression(format: "age * 42"))
    }

    func testDivide() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age / 4),
            NSExpression(format: "age / 4"))
    }

    func testModulus() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age % 4),
            NSExpression(format: "modulus:by:(age, 4)"))
    }

    func testPower() {
        let age = Key<Float>("age")
        XCTAssertEqual(
            *(age ** 4),
            NSExpression(format: "age ** 4"))
    }
    
    // DifferenceExpression
    
    func testDifference() {
        let age = Key<Set<Int>>("age")
        let beauty = Key<Set<Int>>("beauty")
        XCTAssertEqual(
            *(age - beauty),
            NSExpression(format:"age MINUS beauty"))
    }

    // IntersectExpression
    
    func testIntersect() {
        let age = Key<Set<Int>>("age")
        let beauty = Key<Set<Int>>("beauty")
        XCTAssertEqual(
            *(age & beauty),
            NSExpression(format:"age INTERSECT beauty"))
    }
    
    // NullaryDateExpression
    
    func testNow() {
        XCTAssertEqual(
            *now(),
            NSExpression(format:"now()"))
    }

    // NullaryIntegerExpression
    
    func testRandom() {
         XCTAssertEqual(
            *random(),
            NSExpression(format:"random()"))
    }

    // SubqueryExpression
    
    func testSubquery() {
        let age = Key<[Int]>("age")
        let x = Var<Int>("x")
        XCTAssertEqual(
            *subquery(age, iterator: x, predicate: x > 42),
            NSExpression(format: "SUBQUERY(age, $x, $x > 42)"))
    }
    
    // UnaryIntegerExpression
    
    func testRandomN() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *randomn(age),
            NSExpression(format: "randomn(age)"))
    }
    
    func testComplement() {
        let age = Key<Int>("age")
        XCTAssertEqual(
            *(~age),
            NSExpression(format: "~age"))
    }

    // UnaryNumberExpression
    
    func testSqrt() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *sqrt(age),
            NSExpression(format: "sqrt(age)"))
    }
    
    func testLog() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *log(age),
            NSExpression(format: "log(age)"))
    }
    
    func testLn() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *ln(age),
            NSExpression(format: "ln(age)"))
    }
    
    func testExp() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *exp(age),
            NSExpression(format: "exp(age)"))
    }
    
    func testFloor() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *floor(age),
            NSExpression(format: "floor(age)"))
    }
    
    func testCeil() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *ceil(age),
            NSExpression(format: "ceiling(age)"))
    }
    
    func testAbs() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *abs(age),
            NSExpression(format: "abs(age)"))
    }
    
    func testTrunc() {
        let age = Key<Double>("age")
        XCTAssertEqual(
            *trunc(age),
            NSExpression(format: "trunc(age)"))
    }

    // UnarySequenceToNumberExpression
    
    func testSum() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *sum(age),
            NSExpression(format: "sum(age)"))
    }
    
    func testCount() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *count(age),
            NSExpression(format: "count(age)"))
    }
    
    func testMin() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *min(age),
            NSExpression(format: "min(age)"))
    }
    
    func testMax() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *max(age),
            NSExpression(format: "max(age)"))
    }
    
    func testAverage() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *average(age),
            NSExpression(format: "average(age)"))
    }
    
    func testMedian() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *median(age),
            NSExpression(format: "median(age)"))
    }
    
    func testMode() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *mode(age),
            NSExpression(format: "mode(age)"))
    }
    
    func testStddev() {
        let age = Key<[Int]>("age")
        XCTAssertEqual(
            *stddev(age),
            NSExpression(format: "stddev(age)"))
    }

    // UnaryStringExpression
    
    func testUppercase() {
        let age = Key<String>("age")
        XCTAssertEqual(
            *uppercase(age),
            NSExpression(format: "uppercase(age)"))
    }
    
    func testLowercase() {
        let age = Key<String>("age")
        XCTAssertEqual(
            *lowercase(age),
            NSExpression(format: "lowercase(age)"))
    }

    // UnaryStringToIntegerExpression
    
    func testLength() {
        let age = Key<String>("age")
        XCTAssertEqual(
            *length(age),
            NSExpression(format: "length(age)"))
    }

    // UnionExpression
    
    func testUnion() {
        let age = Key<Set<Int>>("age")
        let beauty = Key<Set<Int>>("beauty")
        XCTAssertEqual(
            *(age | beauty),
            NSExpression(format:"age UNION beauty"))
    }
}
