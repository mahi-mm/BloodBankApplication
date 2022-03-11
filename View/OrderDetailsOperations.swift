//
//  InputOrderDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 24/12/21.
//

import Foundation

extension Main{
    func getOrderDetails() -> Orders{
        let orders = Orders(orderID: 0, orderStaus: "", requiredBloodGroup: "", quantityOfBlood: 0, deliveryAddress: [Address]())
        
        print("""
              
              Required Blood Group (A+, B-, AB+,...) :
              """)
        var error = 1
        repeat{
            if let userInput = readLine(){
                orders.requiredBloodGroup = userInput
                guard orders.requiredBloodGroup.isValidBloodGroup() else{
                    print("""
                          
                          Enter Valid Blood Group (A+, B-, AB+,...) :
                          """)
                    error = 1
                    continue
                    }
                error = 0
                break
            }
        }while(error == 1)
            
        print("Required Quantity : ", terminator: "")
        if let  userInput = readLine(){
            if let input = Int(userInput){
                orders.quantityOfBlood = input
            }
        }
        return orders
    }
}
