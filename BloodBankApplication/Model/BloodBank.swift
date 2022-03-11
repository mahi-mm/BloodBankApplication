//
//  BloodBank.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

class BloodBank : Building{
    static var count = 0
    var bloodBankID : Int
    var stock = [Stock]()
    var admin = Admin(adminID: 0, adminEmail: "", password: "")
    
    init(bloodbankID : Int, bloodBankName : String, bloodBankContactNumber : String, bloodBankAddress : [Address], stock : [Stock]) {
        self.bloodBankID = bloodbankID
        self.stock = stock
        super.init(name: bloodBankName, contactNumber: bloodBankContactNumber, address: bloodBankAddress)
    }
}

