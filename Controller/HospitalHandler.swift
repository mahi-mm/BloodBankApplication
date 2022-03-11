//
//  HospitalHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class HospitalHandler{
    var hospitalDetails = [Hospital]()
    var doctorArray = [Doctor]()
    var recipientHandler = RecipientHandler()
    
    func addHospital(hospital : Hospital){
        hospitalDetails.append(hospital)
    }
    
    func listRecipient() -> [Recipient]{
        recipientHandler.listRecipient()
    }
    
    func acceptBlood(hospital : Hospital){
        addHospital(hospital: hospital)
        hospitalDetails.append(hospital)
    }
}
