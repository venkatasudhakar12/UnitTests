//
//  HomeViewController.swift
//  UnitTests
//
//  Created by Sudhakar on 24/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLbl: UILabel!
    var homeVM : HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLbl.text = homeVM.message
    }
}
