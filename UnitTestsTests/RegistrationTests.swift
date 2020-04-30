//
//  RegistrationTests.swift
//  UnitTests
//
//  Created by Sudhakar on 30/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import XCTest

class RegistrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testRegisterWithEmptyEmail(){
        let exp = expectation(description: "registration with empty email")
        let regPre = RegistrationPresenter(delegate: MockUIViewController1(expectation: exp))
        regPre.register(email: "abc@gmail.com", password: "123456545", fullName: "venkata", phoneNumber: "9844904398")
        wait(for: [exp], timeout: 4.0)
    }
    
    func testRegisterWithEmptyPhone(){
        let exp = expectation(description: "registration with empty phone")
        let regPre = RegistrationPresenter(delegate: MockUIViewController1(expectation: exp))
        regPre.register(email: "abc@gmail.com", password: "123456545", fullName: "venkata", phoneNumber: "")
        wait(for: [exp], timeout: 4.0)
    }

}
class MockUIViewController1:RegistrationDelegate{
    var expec:XCTestExpectation
    init(expectation:XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress() {
        
    }
    
    func hideProgress() {
        
    }
    
    func registrationSuccess(title: String, message: String) {
        
    }
    
    func registrationFailed(title: String, message: String) {
        XCTAssertEqual(message, "email can't be blank")
        self.expec.fulfill()
    }
    
    
}
