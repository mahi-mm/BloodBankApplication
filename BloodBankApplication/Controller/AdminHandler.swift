//
//  AdminHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class AdminHandler{
    var admin = [Admin]()
    var order = Orders(orderID: 0, orderStaus: "", requiredBloodGroup: "", quantityOfBlood: 0, deliveryAddress: [Address]())
    var stockDetails = [BloodBank]()
    var bloodBankHandler = BloodbankHandler()
    
    func addAdmin(adminDetails : Admin){
        admin.append(adminDetails)
    }
    
    func manageStock(bloodbankDetails : [BloodBank]){
        stockDetails.append(contentsOf : bloodbankDetails)
    }
    
    func addStock(donorBloodGroup : String, bloodBankDetails : [BloodBank]){
        for details in stockDetails{
            for stock in details.stock{
                if stock.bloodGroup == donorBloodGroup{
                    stock.availableAmount += 1
                    for bloodBankDetails in bloodBankHandler.bloodBankDetails{
                        for stockDetails in bloodBankDetails.stock{
                            if stockDetails.bloodGroup == donorBloodGroup{
                                stockDetails.availableAmount += 1
                            }
                        }
                    }
                }
            }
        }
    }
    
    func setOrderDetails(bloodBank : [BloodBank], requiredBloodGroup : String, quantityOfBlood : Int, deliveryAddress : [Address]) -> String{
        order.orderID += 1
        let bloodGroupEnumChoice = requiredBloodGroup
        for details in bloodBank{
        switch bloodGroupEnumChoice{
        case "A+":
            let filtered = details.stock.filter{ $0.bloodGroup == "A+"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
        
        case "A-":
            let filtered = details.stock.filter{ $0.bloodGroup == "A-"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
            
        case "B+":
            let filtered = details.stock.filter{ $0.bloodGroup == "B+"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
            
        case "B-":
            let filtered = details.stock.filter{ $0.bloodGroup == "B-"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
            
        case "AB+":
            let filtered = details.stock.filter{ $0.bloodGroup == "AB+"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
                
        case "AB-":
            let filtered = details.stock.filter{ $0.bloodGroup == "AB-"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
            
        case "O+":
            let filtered = details.stock.filter{ $0.bloodGroup == "O+"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
                
        case "O-":
            let filtered = details.stock.filter{ $0.bloodGroup == "O-"}
            for stock in filtered{
                if stock.availableAmount >= quantityOfBlood{
                    order.orderStatus = "Stock Available"
                    stock.availableAmount -= quantityOfBlood
                }
                else{
                    order.orderStatus = "Not enough Stock. Please Wait..!!"
                }
            }
            
        default:
            break
        }
        }
        return order.orderStatus
    }
    
    func checkStockAvailablity(bloodGroup : String) -> (String, String, Int){
        var availableAmount : Int = 0
        for details in stockDetails{
            for items in details.stock{
                if items.bloodGroup == bloodGroup{
                    if items.availableAmount <= 3{
                        availableAmount = items.availableAmount
                        return (items.bloodGroup, "Low. Avail Stock immediately", items.availableAmount)
                    }
                    else if items.availableAmount <= 5{
                        return (items.bloodGroup, "Can avail stock", items.availableAmount)
                    }
                }
            }
        }
        return (bloodGroup, "Available", availableAmount)
    }
}
