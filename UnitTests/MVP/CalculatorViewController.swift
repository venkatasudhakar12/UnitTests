//
//  AuthenticationViewController.swift
//  UnitTests
//
//  Created by Sudhakar on 25/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var operationButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    var presenter = CalculatorPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = presenter
        picker.dataSource = presenter
        firstTF.delegate = presenter
        secondTF.delegate = presenter
        presenter.delegate =  self
        okButton.isEnabled = false
        self.picker.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ationForOperation(_ sender: UIButton) {
        self.picker.isHidden = false
    }
    @IBAction func actionForOK(_ sender: UIButton) {
        self.presenter.calculateResult(num1: firstTF.text ?? "0", num2: secondTF.text ?? "0")
    }
}

extension CalculatorViewController:CalculatorDelegate{
    
    func showResult(result: String) {
        self.resultLabel.text = result
    }
    
    func changedOperator(operatorSign: String) {
        self.operationButton.setTitle(operatorSign, for: .normal)
    }
    func enableOkButton(flag: Bool) {
        self.okButton.isEnabled = flag
    }
    func hidePicker() {
         self.picker.isHidden = true
    }
}
