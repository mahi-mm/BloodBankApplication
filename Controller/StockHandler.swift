//
//  StockHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class StockHandler{
    var stockDetails = [Stock]()
    
    func addStock(stock : Stock){
        stockDetails.append(stock)
    }
    func listStock() -> [Stock]{
        return stockDetails
    }
}
