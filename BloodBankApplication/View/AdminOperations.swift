//
//  Admin Operations.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

extension Main{
    func setAdminDetails(userDetails : UserRegistration){
        let admin = Admin(adminID: 0, adminEmail: "", password: "")
        userDetails.email = admin.email
        userDetails.password = admin.password
        admin.adminID += 1
        adminHandler.addAdmin(adminDetails: admin)
    }
    
    func donorRequest(requiredUnits : Int, deliveryAddress : [Address], requiredBloodGroup : [String]) -> [Donor]{
        var searchedValue = [Donor]()
        searchedValue = donorHandler.requestDonors(requiredUnits: requiredUnits, address: deliveryAddress, requiredBloodGroup: requiredBloodGroup)
        return searchedValue
    }
}
