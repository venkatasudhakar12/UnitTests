//
//  BankViewController.swift
//  UnitTests
//
//  Created by Sudhakar on 26/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class BankViewController: UIViewController {

    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var amountLabel: UILabel!
    var bankVM = BankViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        bankVM.delegate = self
        self.amountLabel.text = "\(bankVM.amount)"
        // Do any additional setup after loading the view.

    }
    
    @IBAction func actionForDeposite(_ sender: UIButton) {
        do{
            try bankVM.deposite(amount: Double(amountTF.text ?? "0.0") ?? 0.0)
        }catch LimitError.minus{
            print("Amount should be positive value")
        }catch LimitError.max{
            print("max amount deposite is 2000")
        }catch{
            
        }
        
    }
    @IBAction func actionForWithdraw(_ sender: Any) {
           do{
           try bankVM.withdraw(amount: Double(amountTF.text ?? "0.0") ?? 0.0)
            }catch LimitError.minus{
                   print("Amount should be positive value")
            }catch LimitError.limit{
                   print("Max withdraw amount is 1000")
            }catch LimitError.low{
                    print("Low balance")
           }catch{
            
        }
    }
    
    func task1(){
        DispatchQueue.main.sync {
            for i in 0...5 {
                print(i)
            }
        }
    }
    func task2(){
         DispatchQueue.main.sync {
        for i in 6..<10 {
            print(i)
        }
        }
    }
    func task3(){
         DispatchQueue.main.sync {
        for i in 10...20 {
            print(i)
        }
        }
    }
    
}
extension BankViewController:AmountDelegate{
    func currentBalance(amount: Double) {
        self.amountLabel.text = "\(amount)"
    }
}


class Test:NSObject{
    var result = 0
    var num1:Int
    var num2:Int
    init(num1:Int,num2:Int) {
        self.num1 = num1
        self.num2 = num2
    }
    @objc dynamic func sum(){
        result = num1+num2
    }
    @objc dynamic func sub(){
        result = num1-num2
    }
    func swizzling(){
        let original = class_getInstanceMethod(Test.self, #selector(Test.sum))
        let swizzledMethod = class_getInstanceMethod(Test.self, #selector(Test.sub))
        method_exchangeImplementations(original!, swizzledMethod!)
    }
}
//trailing and auto closure clousures

class Closures{
    func marks(name:String,all:(_ sub1:Int,_ sub2:Int)->Void){
        all(10,20)
    }
    func response(comparison:@autoclosure ()->Bool){
        if comparison() {
            print("it's true")
        }
        else{
            print("it's false")
        }
    }
}
class Subscript{
    var days = ["sunday","monday","tuesday","thursday"]
}
