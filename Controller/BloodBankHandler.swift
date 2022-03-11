//
//  BloodBankHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class BloodbankHandler{
    var bloodBankDetails = [BloodBank]()
    
    func addBloodBank(bloodBank : BloodBank){
        bloodBankDetails.append(bloodBank)
    }
    
    func listBloodBank() -> [BloodBank]{
        return bloodBankDetails
    }
    
    func searchBloodBank(bloodBankID : Int) -> [BloodBank]{
        let filtered = bloodBankDetails.filter{ $0.bloodBankID == bloodBankID}
        return filtered
    }
    
    func editBloodBank(detailsToBeEdited : String, previousDetails : String, newDetails : String) -> Int{
        var edit = 0
        switch detailsToBeEdited{
        case "1":
            bloodBankDetails.filter{ if $0.name == previousDetails{
                edit = 1
                }
            return true
            }.first?.name = newDetails
            
        case "2":
            bloodBankDetails.filter{ if $0.contactNumber == previousDetails{
                edit = 1
                }
            return true
            }.first?.contactNumber = newDetails
            
        case "3":
            for details in bloodBankDetails{
                details.stock = details.stock.filter{ if $0.bloodGroup == previousDetails{
                    edit = 1
                    $0.availableAmount = Int(newDetails)!
                    }
                    return true
                }
            }
        
        default:
            break
        }
        return edit
    }
    
    func deleteBloodBank(detailToBeDeleted : String) -> [BloodBank]{
        var deletedBloodBank = [BloodBank]()
        for (index,bloodbank) in bloodBankDetails.enumerated(){
            if bloodbank.name == detailToBeDeleted{
                deletedBloodBank.append(bloodBankDetails.remove(at: index))
            }
        }
        return deletedBloodBank
    }
}
