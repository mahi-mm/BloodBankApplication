//
//  Recipient.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 23/12/21.
//

import Foundation

class Recipient : Person{
    var recipientID : Int
    var recipientAge : String
    var recipientBloodGroup : String
    var requiredAmount : Int
    var doctorIncharge : String
    
    init(recipientID : Int, name : String, recipientAge : String, recipientBloodGroup : String, requiredAmount : Int, contactNumber : String, email : String, address : [Address], doctorIncharge : String) {
        self.recipientID = recipientID
        self.recipientAge = recipientAge
        self.recipientBloodGroup = recipientBloodGroup
        self.requiredAmount = requiredAmount
        self.doctorIncharge = doctorIncharge
        super.init(name: name, contactNumber: contactNumber, email: email, address: address)
    }
}

