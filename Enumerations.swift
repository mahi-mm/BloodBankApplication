//
//  Enumerations.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 17/12/21.
//

import Foundation

enum TypeOfUserEnum : Int{
    case admin = 1
    case bloodBank = 2
    case hospital = 3
    case donor = 4
    case exit = 5
}

enum DonorOperationEnum : Int{
    case addDonor = 1
    case listDonor = 2
    case editDonor = 3
    case deleteDonor = 4
    case addHistory = 5
    case donateBlood = 6
    case viewRecentDonationHistory = 7
    case exit = 8
}

enum SearchDonorEnum : Int{
    case donorName = 1
    case donorBloodGroup = 2
    case donorAge = 3
    case donorGender = 4
    case donorEmail = 5
    case donorContact = 6
    case donorAddress = 7
    case donorID = 8
    case exit = 9
}

enum EditLabReportsEnum : Int{
    case diastolicBloodPressure = 1
    case systolicBloodPressure = 2
    case alcoholicTest = 3
    case hepatitisB = 4
    case hepatitisC = 5
    case hiv = 6
    case bloodSugar = 7
    case hemoglobin = 8
    case covidTest = 9
    case none = 10
}

enum RecipientEnum : Int{
    case addRecipient = 1
    case editRecipient = 2
    case exit = 3
}

enum EditRecipientEnum : Int{
    case recipientName = 1
    case recipientAge = 2
    case recipientBloodGroup = 3
    case requiredAmount = 4
    case recipientContactNumber = 5
}

enum BloodBankBankOperationsEnum : Int{
    case addBloodBank = 1
    case listBloodBank = 2
    case editBloodBank = 3
    case deleteBloodBank = 4
    case checkStock = 5
    case exit = 6
}

enum HospitalOperationEnum : Int{
    case addHospital = 1
    case addDoctor = 2
    case listDoctors = 3
    case addRecipient = 4
    case listRecipients = 5
    case acceptBlood = 6
    case donateBlood = 7
    case exit = 8
}

enum DoctorEnum : Int{
    case addDoctor = 1
    case editDoctor = 2
    case deleteDoctor = 3
    case exit = 4
}

enum SearchDoctorEnum : Int{
    case doctorID = 1
    case doctorName = 2
    case specialization = 3
    case contactNumber = 4
    case email = 5
}


