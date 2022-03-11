//
//  Address.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

class Address : Equatable{
    var doorNo : String
    var street : String?
    var lane1 : String?
    var lane2 : String?
    var city : String
    var pincode : String
    var district : String
    var state : String
    
    init(doorNo : String, street : String, lane1 : String, lane2 : String, city : String, pincode : String, district : String, state : String) {
        self.doorNo = doorNo
        self.street = street
        self.lane1 = lane1
        self.lane2 = lane2
        self.city = city
        self.pincode = pincode
        self.district = district
        self.state = state
    }
    static func == (lhs: Address, rhs: Address) -> Bool {
        return
            lhs.city == rhs.city &&
        lhs.pincode == rhs.pincode &&
        lhs.district == rhs.district &&
        lhs.state == rhs.state
    }
}
