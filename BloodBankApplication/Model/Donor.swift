//
//  Donor.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 16/12/21.
//

import Foundation

class Donor{
    static var count = 0
    static var numberOfDonations = 0
    var donorID : Int
    var donationDate : String = ""
    var cheerPoints : Int = 0
    var personalDetails = PersonalDetails(donorName: "", donorBloodGroup: "", donorAge: 0, donorGender: "", donorEmail: "", donorContactNumber: "", donorAddress: [Address]())
    var previousHistory = PreviousHistory(labReports: [LabReports](), requirements: [DonorRequirements]())
    
    init(donorID : Int ,personalDetails : PersonalDetails, previousHistory : PreviousHistory) {
        self.donorID = donorID
        self.personalDetails = personalDetails
        self.previousHistory = previousHistory
    }
}

class PersonalDetails : Person{
    var donorBloodGroup : String
    var donorAge : Int
    var donorGender : String
    
    init(donorName : String, donorBloodGroup : String, donorAge : Int, donorGender : String, donorEmail : String, donorContactNumber : String, donorAddress : [Address]) {
        self.donorBloodGroup = donorBloodGroup
        self.donorAge = donorAge
        self.donorGender = donorGender
        super.init(name: donorName, contactNumber: donorContactNumber, email: donorEmail, address: donorAddress)
    }
}


