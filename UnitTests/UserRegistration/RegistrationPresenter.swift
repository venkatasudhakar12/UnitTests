//
//  RegistrationPresenter.swift
//  UnitTests
//
//  Created by Sudhakar on 29/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import Foundation

protocol RegistrationDelegate {
    func showProgress()
    func hideProgress()
    func registrationSuccess(title:String,message: String)
    func registrationFailed(title:String,message: String)
}

class RegistrationPresenter{
    var delegate:RegistrationDelegate
    init(delegate:RegistrationDelegate) {
        self.delegate = delegate
    }
    func register(email: String, password: String, fullName: String, phoneNumber:String){
        if email.isEmpty{
            self.delegate.registrationFailed(title:"Error",message: "email can't be blank")
            return
        }
        if password.isEmpty{
            self.delegate.registrationFailed(title:"Error",message: "password can't be blank")
            return
        }
        if password.count < 8 {
            self.delegate.registrationFailed(title:"Error",message: "the minimum password length is 8 char")
            return
        }
        if fullName.isEmpty{
            self.delegate.registrationFailed(title:"Error",message: "full name can't be blank")
            return
        }
        if phoneNumber.isEmpty{
            self.delegate.registrationFailed(title:"Error",message: "phone number can't be blank")
            return
        }
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.delegate.hideProgress()
            self.delegate.registrationSuccess(title:"Success",message: "Registration is successfully done")
        }
    }
}
