//
//  LoginViewModel.swift
//  UnitTests
//
//  Created by Sudhakar on 24/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    var user:User!
    typealias loginCompletion = ( _ status:Bool, _ message:String )->Void
    fileprivate var loginCompletionBlock:loginCompletion?
    
    func login(_ username:String, _ password:String){
        if username.isEmpty {
            self.loginCompletionBlock?(false,"user name should not empty")
        }
        else if password.isEmpty {
            self.loginCompletionBlock?(false,"password should not empty")
        }
        else{
            self.verifyLogin(username, password)
        }
    }
    
    fileprivate func verifyLogin(_ username:String, _ password:String){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.0) {
            if username == "abc" && password == "123" {
                self.user = User(name: username, password: password)
                     self.loginCompletionBlock?(true,"User is login in successfully")
                }
                else{
                    self.loginCompletionBlock?(false,"user name and passwor is invalid")
               }
        }
    }
    func loginCompletionHandler(callBack: @escaping loginCompletion){
        self.loginCompletionBlock = callBack
    }
    
    public func sum(_ a:Int,_ b:Int)->Int{
        return a+b
    }
}
