//
//  CalculatorPresenter.swift
//  UnitTests
//
//  Created by Sudhakar on 25/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

protocol CalculatorDelegate {
    func showResult(result:String)
    func changedOperator(operatorSign:String)
    func enableOkButton(flag:Bool)
    
    func hidePicker()
}
class CalculatorPresenter: NSObject {
    var index = 0
    fileprivate var operators:[String] = ["➕","➖","✖️","➗"]
    var input:Input!
    var delegate : CalculatorDelegate!
    
    func calculateResult(num1:String,num2:String){
        input = Input(num1: Int(num1) ?? 0, num2: Int(num2) ?? 0)
        switch self.index {
        case 0:
            sum()
        case 1:
            sub()
        case 2:
            mul()
        case 3:
            div()
        default:
            debugPrint("Invalid inputs")
        }
    }
    func sum(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0) {
            let result = self.input.num1+self.input.num2
            self.delegate.showResult(result:String(result))
        }
    }

    func sub(){
           let result = input.num1-input.num2
           delegate.showResult(result:String(result))
       }

    func mul(){
           let result = input.num1*input.num2
           delegate.showResult(result:String(result))
       }

    func div(){
           let result = input.num1/input.num2
           delegate.showResult(result:String(result))
       }
    
}
extension CalculatorPresenter:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operators.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operators[row]
    }
    
}
extension CalculatorPresenter:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate.changedOperator(operatorSign: operators[row])
        index = row
        self.delegate.hidePicker()
    }
}
extension CalculatorPresenter:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 && !textField.text!.isEmpty {
             self.delegate.enableOkButton(flag: true)
        }
        if textField.tag == 2 && !textField.text!.isEmpty {
            self.delegate.enableOkButton(flag: true)
        }
        else{
              self.delegate.enableOkButton(flag: false)
        }
       
    }
    
}
