//
//  BankViewModelTests.swift
//  UnitTests
//
//  Created by Sudhakar on 27/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import XCTest
@testable import UnitTests

class BankViewModelTests: XCTestCase {
    var bank:BankViewModel!
    override func setUp() {
        bank = BankViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        bank = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testWithDraw(){
        let amount = 100.0
        XCTAssertNoThrow(try bank.withdraw(amount: amount))
        XCTAssertEqual(bank.amount, 900.0)
    }
    func testDeposite(){
        let amount = 100.0
        XCTAssertNoThrow(try bank.deposite(amount: amount))
        XCTAssertEqual(bank.amount, 1100.0)
    }
}
