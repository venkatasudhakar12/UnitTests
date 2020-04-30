//
//  UnitTestsTests.swift
//  UnitTestsTests
//
//  Created by Sudhakar on 24/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import XCTest
@testable import UnitTests

class UnitTestsTests: XCTestCase {
    var loginVM:LoginViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginVM = LoginViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginVM = nil
    }

    func testSum(){
      let a = 1
      let b = 2
      let sum = 3
      let result = loginVM.sum(a, b)
      XCTAssertEqual(sum, result)
    }
    
    func testVerifyLogin(){
        let userName = "abc"
        let password = "123"
        loginVM.login(userName, password)
        let exp = expectation(description: "VerifyLogin")
        loginVM.loginCompletionHandler { (status, message) in
            XCTAssertTrue(status)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
