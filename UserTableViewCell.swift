//
//  UserTableViewCell.swift
//  NetworkingApp
//
//  Created by Belén Molina del Campo on 04/05/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareLabels()
    }

    override func prepareForReuse() {
        prepareLabels()
    }
    
    func drawCell(user: User) {
        if let name = user.name {
            nameLabel.text = name
        }
        
        if let email = user.email {
            emailLabel.text = email
        }
        
        if let phone = user.phone {
            phoneLabel.text = phone
        }

    }
    
    func prepareLabels() {
        nameLabel.text = ""
        emailLabel.text = ""
        phoneLabel.text = ""
    }

}
