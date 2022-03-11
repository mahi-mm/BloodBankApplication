//
//  AddressOperations.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 07/03/22.
//

import Foundation

extension Main{
    func getAddressDetails() -> Address{
        let address = Address(doorNo: "", street: "", lane1: "", lane2: "", city: "", pincode: "", district: "", state: "")
        print("Door Number : ", terminator: "")
            if let userInput = readLine(){
                address.doorNo = userInput
            }
            print("Street : ", terminator: "")
            if let userInput = readLine(){
                address.street = userInput
            }
            print("Lane 1 : ", terminator: "")
            if let userInput = readLine(){
                address.lane1 = userInput
            }
            print("Lane 2 : ", terminator: "")
            if let userInput = readLine(){
                address.lane2 = userInput
            }
            print("City : ", terminator: "")
            if let userInput = readLine(){
                address.city = userInput
            }
            print("District : ", terminator: "")
            if let userInput = readLine(){
                address.district = userInput
            }
            print("State : ", terminator: "")
            if let userInput = readLine(){
                address.state = userInput
            }
            print("Pincode : ", terminator: "")
            if let userInput = readLine(){
                address.pincode = userInput
            }
        return address
    }

    func displayAddress(address : Address){
        print("Address : \(address.doorNo), \(address.street ?? ""), \(address.lane1 ?? ""), \(address.lane2 ?? ""), \(address.city), \(address.district), \(address.pincode)")
    }
}
