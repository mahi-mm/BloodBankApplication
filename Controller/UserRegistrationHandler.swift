//
//  UserRegistrationHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class UserRegistrationHandler{
    var adminRegistrationDetails = [UserRegistration]()
    var donorRegistrationDetails = [UserRegistration]()
    var hospitalRegistrationDetails = [UserRegistration]()
    var bloodBankRegistrationDetails = [UserRegistration]()
    
    func addAdmin(user : UserRegistration){
        adminRegistrationDetails.append(user)
    }
    
    func addDonor(user : UserRegistration){
        donorRegistrationDetails.append(user)
    }
    
    func addHospital(user : UserRegistration){
        hospitalRegistrationDetails.append(user)
    }
    
    func addBloodBank(user : UserRegistration){
        bloodBankRegistrationDetails.append(user)
    }
    
    func existingUser(userType : TypeOfUserEnum, user : (String, String)) -> Bool{
        var existingUser = false
        switch userType {
        case .admin:
            for users in adminRegistrationDetails{
                if users.email == user.0 && users.password == user.1{
                    existingUser = true
                    return existingUser
                }
            }
        case .bloodBank:
            for users in bloodBankRegistrationDetails{
                if users.email == user.0 && users.password == user.1{
                    existingUser = true
                    return existingUser
                }
            }
        case .hospital:
            for users in hospitalRegistrationDetails{
                if users.email == user.0 && users.password == user.1{
                    existingUser = true
                    return existingUser
                }
            }
        case .donor:
            for users in donorRegistrationDetails{
                if users.email == user.0 && users.password == user.1{
                    existingUser = true
                    return existingUser
                }
            }
        case .exit:
            break
        }
        return existingUser
    }
}
