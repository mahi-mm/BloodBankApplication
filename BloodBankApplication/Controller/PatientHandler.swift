//
//  PatientHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class PatientHandler{
    var donorArray = [Donor]()
    var recipientArray = [Recipient]()
    var patient = [Patient]()
    
    func addRecipients(addRecipients : [Recipient]){
        recipientArray.append(contentsOf : addRecipients)
        for patients in patient{
            patients.recipeint.append(contentsOf : recipientArray)
        }
    }
    
    func addDonors(addDonors : [Donor]){
        donorArray.append(contentsOf: addDonors)
        for patients in patient{
            patients.donor.append(contentsOf: donorArray)
        }
    }
    
    func listPatients() -> [Patient]{
        var patientArray = [Patient]()
        patientArray.append(Patient(donor: donorArray, recipient: recipientArray))
        return patientArray
    }

}
