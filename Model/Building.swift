//
//  Building.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 03/01/22.
//

import Foundation

class Building{
    var name : String
    var contactNumber : String
    var address = [Address]()
    
    init(name : String, contactNumber : String, address : [Address]) {
        self.name = name
        self.contactNumber = contactNumber
        self.address = address
    }
}
