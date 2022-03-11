//
//  main.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 16/12/21.
//

import Foundation

class Main{
    var donorHandler = DonorHandler()
    var recipientHandler = RecipientHandler()
    var userRegistrationHandler = UserRegistrationHandler()
    var hospitalHandler = HospitalHandler()
    var doctorHandler = DoctorHandler()
    var adminHandler = AdminHandler()
    var bloodBankHandler = BloodbankHandler()
    var typeOfUser = TypeOfUserEnum.donor
    var stockHandler = StockHandler()
    
    func userType(){
        var error = 0
        repeat{
            repeat{
                print("""
                        
                        1. Admin
                        2. BloodBank
                        3. Hospital
                        4. Donor
                        5. Exit
                        """)
                
                if let userInput = readLine() {
                    if let input = Int(userInput){
                        guard TypeOfUserEnum.init(rawValue: input) != nil else {
                            print("Invalid Choice. Try Again")
                            continue
                        }
                        error = 1
                        typeOfUser = TypeOfUserEnum.init(rawValue: input)!
                        main.getOperationChoice(typeOfUser: typeOfUser)
                    }
                }
            }while(error == 0)
        }while(typeOfUser != .exit)
    }
    func getOperationChoice(typeOfUser : TypeOfUserEnum){
        switch typeOfUser{
        case .admin:
            let adminDetails = setUserDetails(userType: .admin)
            userRegistrationHandler.addAdmin(user: adminDetails)
            setAdminDetails(userDetails : adminDetails)
            
        case .donor:
            let userDetails = setUserDetails(userType: .donor)
            userRegistrationHandler.addDonor(user: userDetails)
            setDonorDetails(username: userDetails)
            
        case .bloodBank:
            let userDetails = setUserDetails(userType: .bloodBank)
            userRegistrationHandler.addBloodBank(user: userDetails)
            setBloodBankDetails(userDetails : userDetails)
            
        case .hospital:
            let userDetails = setUserDetails(userType: .hospital)
            userRegistrationHandler.addHospital(user: userDetails)
            setHospitalDetails(userDetails: userDetails)
            
        default:
            break
        }
    }
    
  
}
let main = Main()

main.userType()






