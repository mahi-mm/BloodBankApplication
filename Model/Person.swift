//
//  Person.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

class Person{
    var name : String
    var contactNumber : String
    var email : String?
    var address = [Address]()
    
    init(name : String, contactNumber : String, email : String, address : [Address]) {
        self.name = name
        self.contactNumber = contactNumber
        self.email = email
        self.address = address
    }
}
