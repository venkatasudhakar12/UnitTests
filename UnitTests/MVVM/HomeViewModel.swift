//
//  HomeViewModel.swift
//  UnitTests
//
//  Created by Sudhakar on 24/04/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    let user:User
    init(user:User) {
        self.user = user
    }
    var message:String{
        return "Hi \(user.name) welcome to Swift"
    }
}
