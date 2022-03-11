//
//  HospitalHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

class Hospital : Building{
    var patient = [Patient]()
    var doctor = [Doctor]()
    
    init(hospitalName : String, hospitalContactNumber : String, hospitalAddress : [Address], patient : [Patient], doctor : [Doctor]) {
        super.init(name: hospitalName, contactNumber: hospitalContactNumber, address: hospitalAddress)
        self.patient = patient
        self.doctor = doctor
    }
}

