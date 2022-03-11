//
//  GetUserRegistrationDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 27/12/21.
//

import Foundation

extension Main{
    static var count = 0
    func getUserRegistrationDetails() -> UserRegistration{
        let userRegistration = UserRegistration(email: "", password: "")
        print("Email/Username : ", terminator: "")
        if let userInput = readLine(){
            userRegistration.email = userInput
        }
        print("Password : ", terminator: "")
        if let userInput = readLine(){
            userRegistration.password = userInput
        }
        return userRegistration
    }
    
    func getLoginDetails() -> (String, String){
        let userRegistration = UserRegistration(email: "", password: "")
        print("Email/Username : ", terminator: "")
        if let userInput = readLine(){
            userRegistration.email = userInput
        }
        print("Password : ", terminator: "")
        if let userInput = readLine(){
            userRegistration.password = userInput
        }
        return (userRegistration.email, userRegistration.password)
    }
    
    func setUserDetails(userType : TypeOfUserEnum) -> UserRegistration{
        var error = 0
        var users = UserRegistration(email: "", password: "")
        repeat{
        print("""
              
              1. New User
              2. Existing User
              """)
        if let userInput = readLine(){
            if let input = Int(userInput){
                if input == 1{
                        users = getUserRegistrationDetails()
                        error = 1
                        return users
                }
                if input == 2{
                    let user = getLoginDetails()
                    let existingUserResult = userRegistrationHandler.existingUser(userType: userType, user: (user.0, user.1))
                    guard existingUserResult == true else{
                        print("Wrong login..!! Please register if you are a new user.")
                        continue
                    }
                    print("Welcome..!!")
                    error = 1
                    break
                }
            }
        }
        }while(error == 0)
        return users
    }
}

