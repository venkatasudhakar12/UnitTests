//
//  ViewController.swift
//  UnitTests
//
//  Created by Sudhakar on 24/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var loginVM = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.messageLbl.isHidden =  true
    }

    @IBAction func actionForLogin(_ sender: UIButton) {
        guard let userName = userNameTF.text else {
            return
        }
        guard let password = passwordTF.text else {
                   return
        }
        loginVM.login(userName, password)
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                homeVC.homeVM = HomeViewModel(user: self.loginVM.user)
                self.present(homeVC, animated: true, completion: nil)
            }
            else{
                self.messageLbl.isHidden = false
                self.messageLbl.text = message
            }
        }
    }
    
}

