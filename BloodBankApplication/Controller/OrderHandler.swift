//
//  OrderHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class OrderHandler{
    var orders = [Orders]()
    
    func addOrder(addOrder : Orders){
        orders.append(addOrder)
    }
}
