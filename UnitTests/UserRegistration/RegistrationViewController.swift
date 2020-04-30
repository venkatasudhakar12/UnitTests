//
//  RegistrationViewController.swift
//  UnitTests
//
//  Created by Sudhakar on 29/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

protocol A{
    func f1()
}
//extension A{
//    func f1(){
//       print("A f1")
//    }
//}
protocol B {
    func f1()
}

//extension B {
//    func f1(){
//       print("B f1")
//    }
//}

class C : A,B{
    func f1(){
        
    }
}



class RegistrationViewController: UIViewController {
      @IBOutlet weak var emailTextField: UITextField!
      @IBOutlet weak var passwordTextField: UITextField!
      @IBOutlet weak var fullNameTextField: UITextField!
      @IBOutlet weak var phoneNumberTextField: UITextField!
      var presenter : RegistrationPresenter?
      override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RegistrationPresenter(delegate: self)
        // Do any additional setup after loading the view.
    }

    @IBAction func actionForRegister(_ sender: UIButton) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: fullNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
}

extension RegistrationViewController:RegistrationDelegate{
    func registrationSuccess(title: String, message: String) {
        showAlert(title: title, message: message)
    }
    
    func registrationFailed(title: String, message: String) {
         showAlert(title: title, message: message)
    }
    
    func showProgress() {
        showLoader()
    }
    
    func hideProgress() {
        hideLoader()
    }
    
    
    
}











extension UIViewController {
    
    internal func showLoader() {
        let alert = UIAlertController(title: nil, message: "Please wait".localized , preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
      
    }
    

    internal func hideLoader() {
        if let vc = self.presentedViewController, vc is UIAlertController {
            dismiss(animated: false, completion: nil)
        }
    }
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
extension String {
    var localized:String{
        return NSLocalizedString(self, comment: "")
    }
}
