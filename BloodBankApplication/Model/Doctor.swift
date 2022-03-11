//
//  DoctorHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 27/01/22.
//

import Foundation

class Doctor : Person{
    static var count = 0
    var doctorID : Int
    var specialization : String
    
    init(doctorID : Int, name: String, specialization : String, contactNumber: String, email: String, address: [Address]) {
        self.doctorID = doctorID
        self.specialization = specialization
        super.init(name: name, contactNumber: contactNumber, email: email, address: address)
    }
}

