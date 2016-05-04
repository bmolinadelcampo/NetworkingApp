//
//  User.swift
//  NetworkingApp
//
//  Created by Belén Molina del Campo on 04/05/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class User {

    var name: String?
    var email: String?
    var phone: String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        }
        
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        }
    }
}
