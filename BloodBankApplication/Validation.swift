//
//  ValidationOfLabReports.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 20/12/21.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Za-z0-9_.]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let test  = NSPredicate(format : "SELF MATCHES %@", emailRegEx)
        return test.evaluate(with: self)
    }
}

extension String{
    func isValidPhone() -> Bool {
        let phoneRegex = "^\\d{10}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
}

let labReports = LabReports(donorID : 0, donorBloodGroup: "", donorDiastolicBloodPressure: 0.0, donorSystolicBloodPressure: 0.0, alcoholicTest: 0.0, hepatitisB: 0.0, hepatitisC: 0.0, hiv: 0.0, bloodSugar: 0.0, donorHB: 0.0, covidTest: "")

extension String{
    func isValidBloodGroup() -> Bool {
        let bloodGroupRegEx = "^(A|B|AB|O)[+-]$"
        let bloodGroupTest = NSPredicate(format: "SELF MATCHES %@", bloodGroupRegEx)
        return bloodGroupTest.evaluate(with: self)
    }
    
    func isValidCovidTest() -> Bool{
        if self == "N"{
            return true
        }
        return false
    }
}

extension Int{
    func isValidAge() -> Bool {
        if self >= 18 && self <= 65{
            return true
        }
        return false
    }
}

extension String{
    func yearValidation() -> String{
        let index = self.index(self.startIndex, offsetBy: 6)
        let range = index...endIndex
        let year = String(self[range])
        return year
    }
}

extension Double{
    func isValidDiastolidBloodPressure() -> Bool{
        if self >= 60 && self <= 90{
            return true
        }
        return false
    }
    
    func isValidSystolicBloodPressure() -> Bool{
        if self >= 100 && self <= 160{
            return true
        }
        return false
    }
    
    func isValidAlcoholicTest() -> Bool{
        if self <= 0.04{
            return true
        }
        return false
    }
    
    func isValidHepatitisBTest() -> Bool{
        if self <= 5{
            return true
        }
        return false
    }
    
    func isValidHepatitisCTest() -> Bool{
        if self <= 8{
            return true
        }
        return false
    }
    
    func isValidHIVTest() -> Bool{
        if self == 0{
            return true
        }
        return false
    }
    
    func isValidBloodSugar() -> Bool{
        if self >= 90 && self <= 140 {
            return true
        }
        return false
    }
    
    func isValidFemaleHemoglobin() -> Bool{
        if self >= 12 && self <= 15.5{
            return true
        }
        return false
    }
    
    func isValidMaleHemoglobin() -> Bool{
        if self >= 13.5 && self <= 17.5{
            return true
        }
        return false
    }
    
    func isValidHeight() -> Bool{
        if self >= 140{
            return true
        }
        return false
    }
    
    func isValidWeight() -> Bool{
        if self >= 50{
            return true
        }
        return false
    }
}

