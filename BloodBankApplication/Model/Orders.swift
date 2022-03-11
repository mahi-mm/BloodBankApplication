//
//  Orders.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 23/12/21.
//

import Foundation

class Orders{
    var orderID : Int
    var orderStatus : String
    var quantityOfBlood : Int
    var requiredBloodGroup : String
    var deliveryAddress = [Address]()
    
    init(orderID : Int, orderStaus : String, requiredBloodGroup : String, quantityOfBlood : Int, deliveryAddress : [Address]) {
        self.orderID = orderID
        self.orderStatus = orderStaus
        self.requiredBloodGroup = requiredBloodGroup
        self.quantityOfBlood = quantityOfBlood
        self.deliveryAddress = deliveryAddress
    }
}

