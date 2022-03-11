//
//  GetBloodBankDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

extension Main{
    func getBloodBankDetails() -> BloodBank{
        let bloodBank = BloodBank(bloodbankID: 0, bloodBankName: "", bloodBankContactNumber: "", bloodBankAddress: [Address](), stock: [Stock]())
        print("""
                
                Blood Bank Name :
                """, terminator: "")
        if let userInput = readLine(){
            bloodBank.name = userInput
        }
        print("Blood Bank Contact Number : ", terminator: "")
        var error = 1
        repeat{
            if let userInput = readLine(){
                bloodBank.contactNumber = userInput
                guard bloodBank.contactNumber.isValidPhone() else{
                    print("Enter valid Contact Number : ", terminator: "")
                    error = 1
                    continue
                }
                error = 0
                print("""
                      
                      Blood Bank Address
                      """)
                bloodBank.address.append(getAddressDetails())
                
                print("""
                      
                      Enter Stock Details
                      """)
                getStock()
                let stockDetails = stockHandler.listStock()
                bloodBank.stock = stockDetails
            }
            BloodBank.count += 1
            bloodBank.bloodBankID = BloodBank.count
        }while(error == 1)
        return bloodBank
    }
    
    func setBloodBankDetails(userDetails : UserRegistration){
        var bloodBankDetails = BloodBank(bloodbankID: 0, bloodBankName: "", bloodBankContactNumber: "", bloodBankAddress: [Address](), stock: [Stock]())
        var bloodBankOperationChoice : BloodBankBankOperationsEnum = .addBloodBank
        repeat{
            print("""
                
                1. Add Blood Bank
                2. List Blood Bank
                3. Edit Blood Bank Details
                4. Delete Blood Bank
                5. Check Stock
                6. Exit
                """)
            if let userInput = readLine(){
                if let input = Int(userInput){
                    guard BloodBankBankOperationsEnum(rawValue: input) != nil else{
                        print("Invalid Choice. Try Again")
                        continue
                    }
                    bloodBankOperationChoice = BloodBankBankOperationsEnum.init(rawValue: input)!
            switch bloodBankOperationChoice{
            case .addBloodBank:
                bloodBankDetails = getBloodBankDetails()
                bloodBankHandler.addBloodBank(bloodBank: bloodBankDetails)
                adminHandler.manageStock(bloodbankDetails: [bloodBankDetails])
                
            case .listBloodBank:
                let bloodBanks = bloodBankHandler.listBloodBank()
                for bloodBank in bloodBanks{
                    print("""
                          
                          Blood Bank ID : \(bloodBank.bloodBankID)
                          Name : \(bloodBank.name)
                          Contact Number : \(bloodBank.contactNumber)
                          
                          """)
                    for address in bloodBank.address{
                        displayAddress(address: address)
                    }
                    print("Stock details : ")
                    for stock in bloodBank.stock{
                        print("""
                            
                            Blood Group : \(stock.bloodGroup)            Available Amount : \(stock.availableAmount)
                            """)
                    }
                }
               
            case .editBloodBank:
                var error = 0
                repeat{
                print("""
                      
                      1. To edit Blood Bank Name
                      2. To edit Contact Number
                      3. To edit Stock
                      """)
                if let editChoice = readLine(){
                    guard editChoice != "1" || editChoice != "2" || editChoice != "3" else{
                        print("Invalid Choice")
                        error = 0
                        continue
                    }
                    if editChoice == "3"{
                        print("Blood Group to be edited (A+, B-, AB+,...) : ", terminator: "")
                        if let userInput = readLine(){
                            let previousDetails = userInput
                            print("New Stock : ", terminator: "")
                            if let newDetails = readLine(){
                                let result = bloodBankHandler.editBloodBank(detailsToBeEdited: editChoice, previousDetails: previousDetails, newDetails: newDetails)
                                if result == 1{
                                    print("\(previousDetails) is edited as \(newDetails)")
                                }
                                else{
                                    print("Not found")
                                }
                            }
                            error = 1
                            break
                        }
                    }
                        print("Existing Detail : ", terminator: "")
                        if let userInput = readLine(){
                            let previousDetails = userInput
                            print("New Detail : ", terminator: "")
                            if let newDetails = readLine(){
                                let result = bloodBankHandler.editBloodBank(detailsToBeEdited: editChoice, previousDetails: previousDetails, newDetails: newDetails)
                                if result == 1{
                                    print("\(previousDetails) is edited as \(newDetails)")
                                }
                                else{
                                    print("Not found")
                                }
                            }
                            error = 1
                        }
                    }
                }while(error == 0)
                
            case .deleteBloodBank:
                let deletedBloodBank = bloodBankHandler.deleteBloodBank(detailToBeDeleted: bloodBankDetails.name)
                for bloodbanks in deletedBloodBank{
                    print("""
                          
                          Name : \(bloodbanks.name)
                          Contact Number : \(bloodbanks.contactNumber)
                          """)
                    for address in bloodbanks.address{
                        displayAddress(address: address)
                    }
                }
                
            case .checkStock:
                print("""
                      
                      Blood Group (A+, B-, AB+,...) :
                      """)
                if let userInput = readLine(){
                    let result = adminHandler.checkStockAvailablity(bloodGroup: userInput)
                    for details in bloodBankDetails.stock{
                        if result.0 == details.bloodGroup{
                        print("""
                              
                              Stock Details :
                              Blood Group : \(result.0)
                              Stock Availability : \(details.availableAmount)
                              Remark : \(result.1)
                              """)
                        }
                    }
                    if result.1 == "Low. Avail Stock immediately" || result.1 == "Can avail stock"{
                        let searchedValue = donorHandler.requestDonors(requiredUnits: 3, address: bloodBankDetails.address, requiredBloodGroup: [userInput])
                        print("Checking for donors. Please wait.")
                        if searchedValue.count == 0{
                            print("""
                                  
                                  No donors available
                                  """)
                        }
                        else{
                            print("Please contact the following Donors.")
                            print("Donors List : ")
                            for details in searchedValue{
                                print("""
                                    
                                    Donor ID : \(details.donorID)
                                    Donor Name : \(details.personalDetails.name)
                                    Donor Blood Group : \(details.personalDetails.donorBloodGroup)
                                    Donor Gender : \(details.personalDetails.donorGender)
                                    Donor Contact Number : \(details.personalDetails.contactNumber)
                                    Donor Email : \(details.personalDetails.email ?? "")
                                    """)
                                for address in details.personalDetails.address{
                                    displayAddress(address: address)
                                }
                            }
                        }
                    }
                }
                
            default:
                break
            }
                }
            }
        }while(bloodBankOperationChoice != .exit)
    }
    
    func bloodTyping(bloodGroup : String) -> [String]{
        var eligibleBloodGroups = [String]()
        switch bloodGroup{
        case "A+":
            eligibleBloodGroups.append("A+")
            eligibleBloodGroups.append("A-")
            eligibleBloodGroups.append("O+")
            eligibleBloodGroups.append("O-")
        
        case "A-":
            eligibleBloodGroups.append("A-")
            eligibleBloodGroups.append("O-")
        
        case "B+":
            eligibleBloodGroups.append("A+")
            eligibleBloodGroups.append("B-")
            eligibleBloodGroups.append("O+")
            eligibleBloodGroups.append("O-")
            
        case "B-":
            eligibleBloodGroups.append("B-")
            eligibleBloodGroups.append("O-")
            
        case "AB+":
            eligibleBloodGroups.append("AB+")
            eligibleBloodGroups.append("A+")
            eligibleBloodGroups.append("A-")
            eligibleBloodGroups.append("B+")
            eligibleBloodGroups.append("B-")
            eligibleBloodGroups.append("AB-")
            eligibleBloodGroups.append("O+")
            eligibleBloodGroups.append("O-")
            
        case "AB-":
            eligibleBloodGroups.append("AB-")
            eligibleBloodGroups.append("A-")
            eligibleBloodGroups.append("B-")
            eligibleBloodGroups.append("O-")
            
        case "O+":
            eligibleBloodGroups.append("O+")
            eligibleBloodGroups.append("O-")
        
        case "O-":
            eligibleBloodGroups.append("O-")
        default:
            break
        }
        return eligibleBloodGroups
    }
}
