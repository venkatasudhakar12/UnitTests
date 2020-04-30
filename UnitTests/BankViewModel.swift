//
//  BankViewModel.swift
//  UnitTests
//
//  Created by Sudhakar on 26/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit


protocol AmountDelegate {
    func currentBalance(amount:Double)
}
class BankViewModel: NSObject {
    var delegate:AmountDelegate?
    fileprivate var account = Account()
    var kvoToken: NSKeyValueObservation?
    override init() {
       super.init()
       kvoToken = account.observe(\Account.amount, options: .new) { account, changed in
        self.delegate?.currentBalance(amount: account.amount)
        }
    }
    deinit {
        kvoToken?.invalidate()
    }
    var amount:Double{
        return account.amount
    }
    func withdraw(amount:Double) throws {

        if amount<0.0{
            throw LimitError.minus
        }
        else if amount>1000.0{
            throw LimitError.limit
        }
        else if account.amount<amount{
            throw LimitError.low
        }
        else{
            account.amount -= amount
        }
    }
    func deposite(amount:Double) throws {
        if amount<0.0{
            throw LimitError.minus
        }
        else if amount>2000.0{
            throw LimitError.max
        }
        else{
            account.amount += amount
        }
    }
    
}
enum LimitError:Error{
    case minus
    case limit
    case max
    case low
}
