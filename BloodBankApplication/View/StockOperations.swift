//
//  StockOperations.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 04/01/22.
//

import Foundation

extension Main{
    func getStock(){
        print("A+ : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "A+"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("A- : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "A-"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("B+ : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "B+"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("B- : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "B-"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("AB+ : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "AB+"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("AB- : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "AB-"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("O+ : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "O+"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
        print("O- : ", terminator: "")
        if let userInput = readLine(){
            if let input = Int(userInput){
                let stockDetails = Stock(bloodGroup: "", availableAmount: 0)
                stockDetails.bloodGroup = "O-"
                stockDetails.availableAmount = input
                stockHandler.addStock(stock: stockDetails)
            }
        }
    }
}
