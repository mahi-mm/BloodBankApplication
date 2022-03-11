//
//  InputRecipientDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 23/12/21.
//

import Foundation

extension Main{
    func getRecipientDetails(listOfDoctors : [Doctor]) -> Recipient{
        let recipient = Recipient(recipientID: 0, name: "", recipientAge: "", recipientBloodGroup: "", requiredAmount: 0, contactNumber: "", email: "", address: [Address](), doctorIncharge: "")
        
        let userInput = "N"
        repeat{
            print("""
                  
                  Enter Y to add Recipient Details, else enter N
                  """)
            if let userInput = readLine(){
                if userInput.range(of: "Y", options: .caseInsensitive) != nil{
                    print("Recipient Name : ", terminator: "")
                    guard let userInput = readLine() else {
                        break
                    }
                    recipient.name = userInput
                    print("Recipient Age : ", terminator: "")
                    guard let userInput = readLine() else{
                        break
                    }
                    recipient.recipientAge = userInput
                        print("Recipient Blood Group (A+, B-, AB+,...) : ", terminator: "")
                    var error = 0
                    repeat{
                        if let userInput = readLine(){
                            recipient.recipientBloodGroup = userInput
                            guard recipient.recipientBloodGroup.isValidBloodGroup() else{
                                continue
                            }
                            print("Required Amount(in units) : ", terminator: "")
                            if let userInput = readLine(){
                            guard let input = Int(userInput) else{
                                break
                            }
                            recipient.requiredAmount = input
                            }
                            print("Contact Number : ", terminator: "")
                            repeat {
                                guard let userInput = readLine() else{
                                    break
                                }
                                recipient.contactNumber = userInput
                                if recipient.contactNumber.isValidPhone(){
                                    error = 1
                                    print("""
                                          Recipient Address :
                                          """)
                                    recipient.address.append(getAddressDetails())
                                    print("Doctor Incharge : ", terminator: "")
                                    repeat{
                                    if let userInput = readLine(){
                                        if userInput.range(of: userInput,options: .caseInsensitive) != nil{
                                            recipient.doctorIncharge = userInput
                                            let doctorsList = listOfDoctors
                                            let filtered = doctorsList.filter{ $0.name == recipient.doctorIncharge }
                                            if filtered.count == 0{
                                                print("Enter a valid Doctor Incharge.")
                                                error = 0
                                                continue
                                            }
                                            error = 1
                                        }
                                    }
                                    }while(error == 0)
                                    break
                                }
                                else{
                                    print("Enter Valid Contact Number : ", terminator: "")
                                    error = 0
                                    continue
                                }
                            }while(error == 0)
                        }
                        else{
                            print("""
                                  
                                  Enter Valid Blood Group (A+, B-, AB+,...) :
                                  """)
                            error = 0
                            continue
                            }
                        }while(error == 0)
                    recipient.recipientID += 1
                    
                    print("Hi \(recipient.name)..!! Your Recipient ID is \(recipient.recipientID)")
                }
            }
            else{
                break
            }
        }while(userInput == "Y")
        return recipient
    }

    func setRecipientDetails(listOfDoctors : [Doctor]) -> Recipient {
        var recipientChoice : RecipientEnum = .addRecipient
        var recipientDetails = Recipient(recipientID: 0, name: "", recipientAge: "", recipientBloodGroup: "", requiredAmount: 0, contactNumber: "", email: "", address: [Address](), doctorIncharge: "")
        repeat{
            print("""
                
                1. Add Recipient
                2. Edit Recipient Details
                3. Exit
                """)
            if let userInput = readLine(){
                if let input = Int(userInput){
                    guard BloodBankBankOperationsEnum(rawValue: input) != nil else{
                        print("Invalid Choice. Try Again")
                        continue
                    }
                    recipientChoice = RecipientEnum.init(rawValue: input)!
                    switch recipientChoice{
                    case .addRecipient:
                        recipientDetails = getRecipientDetails(listOfDoctors: listOfDoctors)
                        recipientHandler.addRecipient(addRecipient: recipientDetails)
                        
                    case .editRecipient:
                        print("""
                            
                            1. Recipient Name
                            2. Recipient Age
                            3. Recipent Blood Group
                            4. Required Amount
                            5. Recipient Contact Number
                            """)
                        if let userInput = readLine(){
                            if let input = Int(userInput){
                                let detailToBeEdited = EditRecipientEnum.init(rawValue: input)
                                print("Enter Recipient ID : ", terminator: "")
                        if let userInput = readLine(){
                            if let input = Int(userInput){
                                let recipientIdToBeEdited = input
                                print("Enter the existing detail : ", terminator: "")
                                if let existingDetail = readLine(){
                                    print("Enter the new detail : ", terminator: "")
                                if let newDetails = readLine(){
                                    let editSucessful =  recipientHandler.editRecipient(detailToBeEdited : detailToBeEdited!, recipientIdToBeEdited: recipientIdToBeEdited, previousDetail: existingDetail, newDetail: newDetails)
                                        if editSucessful == 1{
                                            print("\(existingDetail) is edited as \(newDetails)")
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
                
                case .exit:
                    break
                }
            }
        }
    }while(recipientChoice != .exit)
        return recipientDetails
    }
    
    func listRecipient() -> [Recipient]{
        recipientHandler.listRecipient()
    }
}
