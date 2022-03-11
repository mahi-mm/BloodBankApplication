//
//  AdminHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

class Admin{
    var adminID : Int
    var email : String
    var password : String
    
    init(adminID : Int, adminEmail : String, password : String) {
        self.adminID = adminID
        self.email = adminEmail
        self.password = password
    }
}


