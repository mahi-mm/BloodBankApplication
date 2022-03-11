//
//  InputDonorDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 20/12/21.
//

import Foundation
extension Main{
    func getDonorDetails() -> Donor{
        let donor = Donor(donorID : Donor.count ,personalDetails: PersonalDetails(donorName: "", donorBloodGroup: "", donorAge: 0, donorGender: "", donorEmail: "", donorContactNumber: "", donorAddress: [Address]()), previousHistory: PreviousHistory(labReports: [LabReports](), requirements: [DonorRequirements]()))
        var error = 0
        let userInput = "N"
        repeat{
            print("""
                  
                  Enter Y to add new Donor, else enter N
                  """)
            if let userInput = readLine(){
                if userInput.range(of: userInput, options: .caseInsensitive) != nil{
                    print("Donor Name : ", terminator: "")
                        guard let userInput = readLine() else {
                        break
                    }
                        donor.personalDetails.name = userInput
                    print("Donor Blood Group (A+, B-, AB+,...) : ", terminator: "")
                    repeat {
                        guard let userInput = readLine() else {
                        break
                    }
                        donor.personalDetails.donorBloodGroup = userInput
                        if donor.personalDetails.donorBloodGroup.isValidBloodGroup(){
                        error = 1
                        break
                    }
                    else{
                        print("""
                              
                              Enter valid Blood Group (A+, B-, AB+,...) :
                              """, terminator: "")
                        error = 0
                        continue
                    }
                    }while(error == 0)
                    
                    
                    print("Donor Age : ", terminator: "")
                        guard let userInput = readLine() else {
                            break
                        }
                    if let input = Int(userInput){
                        donor.personalDetails.donorAge = input
                        if donor.personalDetails.donorAge.isValidAge(){
                            error = 1
                        }
                        else{
                            print("Not eligible to donate blood. Thank You..!!")
                            error = 1
                            break
                        }
                    }
                    
                    print("Donor Gender(F for female and M for male) : ", terminator: "")
                        guard let userInput = readLine()else {
                        break
                    }
                        donor.personalDetails.donorGender = userInput
                    
                    print("Donor Email : ", terminator: "")
                    repeat{
                        guard let userInput = readLine()else {
                        break
                    }
                        donor.personalDetails.email = userInput
                        if donor.personalDetails.email != ""{
                            if donor.personalDetails.email!.isValidEmail(){
                            print("Donor Contact Number : ", terminator: "")
                            repeat{
                                guard let userInput = readLine()else {
                                break
                            }
                                error = 1
                                donor.personalDetails.contactNumber = userInput
                                if donor.personalDetails.contactNumber.isValidPhone(){
                            print("""
                                  
                                  Donor Address :
                                  """)
                                    donor.personalDetails.address.append(getAddressDetails())
                                }
                                else{
                                    print("Enter valid contact number : ", terminator: "")
                                    error = 0
                                    continue
                                }
                            }while (error == 0)
                        }
                    }
                    else{
                        print("Enter valid email : ", terminator: "")
                        error = 0
                        continue
                    }
                    }while (error == 0)
                    let userChoiceToAddHistory = "N"
                        repeat{
                            print("""
                                  
                                  Enter Y to add history else enter N
                                  """)
                        if let userChoiceToAddHistory = readLine(){
                            if userChoiceToAddHistory.range(of: "Y", options: .caseInsensitive) != nil {
                                Donor.count += 1
                                let result = getLabReports(donorGender: donor.personalDetails.donorGender)
                                donor.previousHistory.labReports.append(result.1)
                                if result.0 == 0{
                                    break
                                }
                                else{
                                    donor.previousHistory.requirements.append(getRequirements())
                                }
                            }
                            else{
                                break
                            }
                        }
                        donor.donorID = Donor.count
                        print("""
                              
                              Hi \(donor.personalDetails.name)..!! Your Donor ID is \(donor.donorID)
                              """)
                        }while(userChoiceToAddHistory != "N")
                    }
                }
            }while (userInput == "Y")
        return donor
        }

    func getLabReports(donorGender : String) -> (Int, LabReports){
        let labReports = LabReports(donorID: Donor.count, donorBloodGroup: "", donorDiastolicBloodPressure: 0.0, donorSystolicBloodPressure: 0.0, alcoholicTest: 0.0, hepatitisB: 0.0, hepatitisC: 0.0, hiv: 0.0, bloodSugar: 0.0, donorHB: 0.0, covidTest: "")
       var error = 0
    repeat{
        print("""
              
              Enter the Lab Report Details. Enter the values alone.
              """)
        print("Donor Blood Group (A+, B-, AB+,...) : ", terminator: "")
        repeat {
            guard let userInput = readLine() else {
                break
            }
            labReports.donorBloodGroup = userInput
            if labReports.donorBloodGroup.isValidBloodGroup(){
                error = 1
                break
            }
            else{
            print("""
                  
                  Enter valid Blood Group (A+, B-, AB+,...) :
                  """, terminator: "")
            error = 0
            continue
        }
        }while(error == 0)
        
        
        print("Diastolic Blood Pressure : ", terminator: "")
            guard let userInput = readLine() else {
            break
            }
            if let input = Double(userInput){
                labReports.donorDiastolicBloodPressure = input
                if labReports.donorDiastolicBloodPressure.isValidDiastolidBloodPressure() {
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        print("Systolic Blood Pressure : ", terminator: "")
            guard let userInput = readLine() else {
                break
            }
            if let input = Double(userInput){
                labReports.donorSystolicBloodPressure = input
                if labReports.donorSystolicBloodPressure.isValidSystolicBloodPressure() {
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        
        print("Alcoholic Test : ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
            if let input = Double(userInput){
                labReports.alcoholicTest = input
                if labReports.alcoholicTest.isValidAlcoholicTest() {
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        
        print("Hepatitis B : ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
            if let input = Double(userInput) {
                labReports.hepatitisB = input
                if labReports.hepatitisB.isValidHepatitisBTest() {
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        
        print("Hepatitis C : ", terminator: "")
            guard let userInput = readLine() else{
            break
        }
            if let input = Double(userInput) {
                labReports.hepatitisC = input
                if labReports.hepatitisC.isValidHepatitisCTest() {
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        
        print("HIV : ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
            if let input = Double(userInput){
                labReports.hiv = input
                if labReports.hiv.isValidHIVTest(){
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
        
        print("Blood Sugar(After food) : ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
            if let input = Double(userInput) {
                labReports.bloodSugar = input
                if labReports.bloodSugar.isValidBloodSugar(){
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
                
        print("Hemoglobin : ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
                if let input = Double(userInput) {
                    labReports.donorHB = input
                    if donorGender == "F" && labReports.donorHB.isValidFemaleHemoglobin(){
                        error = 1
                    }
                    else if donorGender == "M" && labReports.donorHB.isValidMaleHemoglobin(){
                        error = 1
                    }
                    else{
                        print("Not eligible to donate blood. Thank you..!!")
                        error = 0
                        return (error, labReports)
                    }
                }
        print("Covid Test (P for positive and N for negative): ", terminator: "")
            guard let userInput = readLine() else {
            break
        }
        labReports.covidTest = userInput
                if labReports.covidTest.isValidCovidTest(){
                    error = 1
                }
                else{
                    print("Not eligible to donate blood. Thank you..!!")
                    error = 0
                    return (error, labReports)
                }
            }
    }while(error == 0)
    return (error, labReports)
}


func getRequirements() -> DonorRequirements{
    var error = 0
    let requirements = DonorRequirements(donorID: Donor.count, donorHeight: 0.0, donorWeight: 0.0, donorMedicalStatus: "")
        repeat{
        print("Donor Height(in cms) : ", terminator: "")
        guard let userInput = readLine() else{
            break
        }
        if let input = Double(userInput){
            requirements.donorHeight = input
            if requirements.donorHeight.isValidHeight(){
                error = 1
            }
            else{
                print("""
                      Not eligible to donate blood. Thank you..!!
                      """)
                break
            }
        }
        
        print("Donor Weight(in kgs) : ", terminator: "")
        guard let userInput = readLine() else{
            break
        }
        if let input = Double(userInput){
            requirements.donorWeight = input
            if requirements.donorWeight.isValidWeight(){
                error = 1
            }
            else{
                print("Not eligible to donate blood. Thank you..!!")
                break
            }
        }
        
        print("Medical Status : ", terminator: "")
        guard let userInput  = readLine() else{
            break
        }
        requirements.donorMedicalStatus = userInput
        }while(error == 0)
    return requirements
    }
    
    func setDonorDetails(username : UserRegistration){
        var userOperationChoice : DonorOperationEnum = .exit
        var user = Donor(donorID : Donor.count ,personalDetails: PersonalDetails(donorName: "", donorBloodGroup: "", donorAge: 0, donorGender: "", donorEmail: "", donorContactNumber: "", donorAddress: [Address]()), previousHistory: PreviousHistory(labReports: [LabReports](), requirements: [DonorRequirements]()))
        
        func displayDonorDetails(donorId : Int){
            let donorHistory = donorHandler.listDonor(userID: donorId)
            if donorHistory.count == 0{
                print("Please add lab reports before you donate blood.")
            }
            else{
                for donors in donorHistory{
                    user.personalDetails.donorBloodGroup = donors.personalDetails.donorBloodGroup
                    print("""
                            
                            Donor Details :
                            
                            Name : \(donors.personalDetails.name)
                            Blood Group : \(donors.personalDetails.donorBloodGroup)
                            Age : \(donors.personalDetails.donorAge)
                            Gender : \(donors.personalDetails.donorGender)
                            Email : \(donors.personalDetails.email ?? "")
                            Contact Number : \(donors.personalDetails.contactNumber)
                            """)
                            for address in donors.personalDetails.address{
                                displayAddress(address: address)
                            }
                                                    
                        for history in donors.previousHistory.labReports{
                            print("""
                                
                                Reports :
                                Blood Group : \(history.donorBloodGroup)
                                Diastolic Blood Presuure : \(history.donorDiastolicBloodPressure)
                                Systolic Blood Pressure : \(history.donorSystolicBloodPressure)
                                Alcoholic Test : \(history.alcoholicTest)
                                HepatitisB : \(history.hepatitisB)
                                HepatitisC : \(history.hepatitisC)
                                HIV : \(history.hiv)
                                Blood Sugar : \(history.bloodSugar)
                                Hemoglobin : \(history.donorHB)
                                Covid Test : \(history.covidTest)
                                """)
                            }
                        for requirements in donors.previousHistory.requirements{
                            print("""
                                Height : \(requirements.donorHeight)
                                Weight : \(requirements.donorWeight)
                                Medical Status : \(requirements.donorMedicalStatus)
                                """)
                            }
                        }
                    }
                }
        
        repeat{
            print("""
                
                1. Add Donor Details
                2. List All Donor Details
                3. Edit Donor Details
                4. Delete Donor Details
                5. Add Lab Reports and Requirements
                6. Donate Blood
                7. View Recent Donation History
                8. Exit
                """)
            if let userInput = readLine(){
                if let input = Int(userInput){
                    guard DonorOperationEnum(rawValue: input) != nil else{
                        print("Invalid Choice. Try Again")
                        continue
                    }
                userOperationChoice = DonorOperationEnum(rawValue: input)!
        
        switch userOperationChoice{
        case .addDonor:
            user = getDonorDetails()
            donorHandler.addDonor(addDonor: user)
                
        case .listDonor:
            print("""
                    
                  Enter the Donor ID
                  """)
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    displayDonorDetails(donorId: donorID)
                }
            }
        
        case .editDonor:
            print("""
                    
                  Enter the Donor ID
                  """)
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    print("""
                        
                        1. To edit Name
                        2. To edit Blood Group
                        3. To edit Age
                        4. To edit Gender
                        5. To edit Email
                        6. To edit Contact Number
                        7. To edit Address
                        """)
                    if let userInput = readLine(){
                        if let detailToBeEdited = Int(userInput){
                            let detailToBeEdited = SearchDonorEnum.init(rawValue: detailToBeEdited)
                            var previousDetail = ""
                            var newDetail = ""
                            print("Enter the existing detail : ")
                            if let userInput = readLine(){
                                previousDetail = userInput
                                print("Enter the new detail : ")
                                if let userInput = readLine(){
                                newDetail = userInput
                                    let editSucessful = donorHandler.editDonor(donorIdToBeEdited : donorID, detailsToBeEdited: detailToBeEdited!, previousDetails: previousDetail, newDetails: newDetail)
                                    if editSucessful == 1{
                                        print("\(previousDetail) is edited as \(newDetail)")
                                    }
                                    else{
                                        print("Not found")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        case .deleteDonor:
            print("""
                  
                  Donor ID :
                  """, terminator: "")
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    let deletedDonor = donorHandler.deleteDonor(detailToBeDeleted: donorID)
                    for donors in deletedDonor{
                        print(donors.donorID, donors.personalDetails.name, donors.personalDetails.donorBloodGroup, donors.personalDetails.donorGender, donors.personalDetails.email ?? "", donors.personalDetails.contactNumber, donors.personalDetails.address)
                    }
                }
            }
            
        case .addHistory:
            print("""
                  
                  Donor ID :
                  """, terminator: "")
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    print("Donor Gender : ", terminator: "")
                    if let userInput = readLine(){
                        let donorGender = userInput
                        let labReports = getLabReports(donorGender: donorGender)
                        let requirements = getRequirements()
                        let previousHistory = PreviousHistory(labReports: [labReports.1], requirements: [requirements])
                        donorHandler.addHistory(addHistoryDetails: [previousHistory], user: donorID)
                    }
                }
            }
            
        case .donateBlood:
            print("""

                  Donor ID :
                  """, terminator: "")
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    print("Enter Y if you are willing to donate blood, else enter N")
                    if let userInput = readLine(){
                        if userInput.range(of: "Y", options: .caseInsensitive) != nil{
                            let availableBloodBanks = bloodBankHandler.listBloodBank()
                            if availableBloodBanks.count == 0{
                                print("No Blood Banks available.")
                                break
                            }
                            print("Have you donated blood in the past 3 months interval ? Enter Y if yes, else enter N.")
                            if let userInput = readLine(){
                                if userInput.range(of: "N", options: .caseInsensitive) != nil{

                                    print("Donor details : ")
                                    displayDonorDetails(donorId: donorID)
                                        for bloodBank in availableBloodBanks{
                                            print("""

                                                  Available Blood Banks :
                                                  Blood Bank ID : \(bloodBank.bloodBankID)
                                                  Name : \(bloodBank.name)
                                                  Contact Number : \(bloodBank.contactNumber)
                                                  """)
                                            for address in bloodBank.address{
                                                displayAddress(address: address)
                                            }
                                    }
                                    print("""

                                          Enter the Blood Bank ID in which you wish to donate blood
                                          """)
                                    if let userInput = readLine(){
                                        if let id = Int(userInput){
                                            let availableBloodBanks = bloodBankHandler.searchBloodBank(bloodBankID: id)
                                            adminHandler.addStock(donorBloodGroup: user.personalDetails.donorBloodGroup, bloodBankDetails: availableBloodBanks)
                                        }
                                    }
                                    let donorDetails = donorHandler.listDonor(userID: donorID)

                                    let date = Date()
                                    let dateFormatter = DateFormatter()

                                    dateFormatter.dateFormat = "dd.MM.yyyy"

                                    let currentDate = dateFormatter.string(from: date)
                                    let donorsList = donorHandler.donateBlood(donorID : donorID, donor : donorDetails, date: currentDate)
                                    for donors in donorsList {
                                        Donor.numberOfDonations += 1
                                        print("""

                                              \(donors.personalDetails.name), Thank you for donating blood.
                                              Summary :
                                              Blood Group : \(donors.personalDetails.donorBloodGroup)
                                              Quantity : 1 unit
                                              """)
                                        let cheerPoints = donorHandler.donorCheerPoints(donorId : donorID)
                                        if cheerPoints.1 == 0{
                                            break
                                        }
                                        else{
                                            print("""

                                                  Name : \(cheerPoints.0)
                                                  Cheer Points : \(cheerPoints.1)
                                                  """)
                                            break
                                        }
                                    }
                                }
                            else{
                                print("Not eligible to donate blood. Thank you..!!")
                            }
                        }
                    }
                }
            }
        }
            
        case .viewRecentDonationHistory:
            print("Donor ID : ", terminator: "")
            if let userInput = readLine(){
                if let donorID = Int(userInput){
                    let recentHistory = donorHandler.viewRecentDonationHistory(donorID: donorID)
                    if recentHistory.count == 0{
                        print("You have not donated blood before.")
                    }
                    else{
                        for details in recentHistory{
                            print("""
                                  
                                  History :
                                  Donor ID : \(details.donorID)
                                  Name : \(details.personalDetails.name)
                                  Blood Group : \(details.personalDetails.donorBloodGroup)
                                  Contact Number : \(details.personalDetails.contactNumber)
                                  """)
                        }
                    }
                }
            }
        case .exit:
            break
        }
        }
    }
    }while(userOperationChoice != .exit)
}
}
