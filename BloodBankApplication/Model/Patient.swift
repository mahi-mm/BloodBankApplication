//
//  Patient.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 25/01/22.
//

import Foundation

class Patient: Person{
    var donor = [Donor]()
    var recipeint = [Recipient]()
    
    init(donor : [Donor], recipient : [Recipient]){
        self.donor = donor
        self.recipeint = recipient
        super.init(name: "", contactNumber: "", email: "", address: [Address]())
    }
}

