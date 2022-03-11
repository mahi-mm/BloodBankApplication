//
//  HistoryHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 16/12/21.
//

import Foundation

class LabReports{
    var donorID : Int
    var donorBloodGroup : String
    var donorDiastolicBloodPressure : Double
    var donorSystolicBloodPressure : Double
    var alcoholicTest : Double
    var hepatitisB : Double
    var hepatitisC : Double
    var hiv : Double
    var bloodSugar : Double
    var donorHB : Double
    var covidTest : String
    
    init(donorID : Int, donorBloodGroup : String, donorDiastolicBloodPressure : Double, donorSystolicBloodPressure : Double, alcoholicTest : Double, hepatitisB : Double, hepatitisC : Double, hiv : Double, bloodSugar : Double, donorHB : Double, covidTest : String) {
        self.donorID = donorID
        self.donorBloodGroup = donorBloodGroup
        self.donorDiastolicBloodPressure = donorDiastolicBloodPressure
        self.donorSystolicBloodPressure = donorSystolicBloodPressure
        self.alcoholicTest = alcoholicTest
        self.hepatitisB = hepatitisB
        self.hepatitisC = hepatitisC
        self.hiv = hiv
        self.bloodSugar = bloodSugar
        self.donorHB = donorHB
        self.covidTest = covidTest
    }
}

class DonorRequirements{
    var donorID : Int
    var donorHeight : Double
    var donorWeight : Double
    var donorMedicalStatus : String
    
    init(donorID : Int, donorHeight : Double, donorWeight : Double, donorMedicalStatus : String) {
        self.donorID = donorID
        self.donorHeight = donorHeight
        self.donorWeight = donorWeight
        self.donorMedicalStatus = donorMedicalStatus
    }
}

class PreviousHistory{
    var labReports  = [LabReports]()
    var requirements = [DonorRequirements]()
    
    init(labReports : [LabReports], requirements : [DonorRequirements]) {
        self.labReports = labReports
        self.requirements = requirements
    }
}

class HistoryHandler{
    var donorPreviousHistory = [PreviousHistory]()
    var labreports = [LabReports]()
    var donorRequirements = [DonorRequirements]()
    
    func addHistory(addHistory : [PreviousHistory], userID : Int){
        for reports in addHistory{
            labreports.append(contentsOf: reports.labReports)
            donorRequirements.append(contentsOf : reports.requirements)
        }
        donorPreviousHistory.append(contentsOf: addHistory)
    }
    
    func listHistory(userID : Int) -> [PreviousHistory]{
        var previousHistory = [PreviousHistory]()
        var donorLabReports = [LabReports]()
        var requirementsForDonor = [DonorRequirements]()
        donorLabReports.append(contentsOf : labreports.filter{ $0.donorID == userID})
        requirementsForDonor.append(contentsOf: donorRequirements.filter{ $0.donorID == userID})
        previousHistory.append(PreviousHistory(labReports: donorLabReports, requirements: requirementsForDonor))
        return previousHistory
    }

}
