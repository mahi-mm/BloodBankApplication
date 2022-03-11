//
//  RecipientHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class RecipientHandler{
    var recipients = [Recipient]()
    var patientHandler = PatientHandler()

    func addRecipient(addRecipient : Recipient){
        patientHandler.addRecipients(addRecipients: [addRecipient])
        recipients.append(addRecipient)
    }
    
    func listRecipient() -> [Recipient]{
        return recipients
    }
    
    func searchRecipient(searchFor : EditRecipientEnum, detailToBeSearched : String) -> [Recipient]{
        let searchedRecipient = recipients.filter{ items in
            switch searchFor{
            case .recipientName:
                if detailToBeSearched.range(of: detailToBeSearched, options: .caseInsensitive) != nil{
                    if items.name.contains(detailToBeSearched){
                        return true
                    }
                    return false
                }
            
            case .recipientAge:
                if detailToBeSearched.range(of: detailToBeSearched, options: .caseInsensitive) != nil{
                if items.recipientAge.contains(detailToBeSearched){
                    return true
                }
                return false
            }
            case .recipientBloodGroup:
                if detailToBeSearched.range(of: detailToBeSearched, options: .caseInsensitive) != nil{
                    if items.recipientBloodGroup == detailToBeSearched{
                    return true
                }
                return false
            }
                
            case .requiredAmount:
                let requiredQuantity = String(items.requiredAmount)
                if detailToBeSearched.range(of: detailToBeSearched, options: .caseInsensitive) != nil{
                if requiredQuantity.contains(detailToBeSearched){
                    return true
                }
                return false
            }
                
            case .recipientContactNumber:
                if detailToBeSearched.range(of: detailToBeSearched, options: .caseInsensitive) != nil{
                if items.contactNumber.contains(detailToBeSearched){
                    return true
                }
                return false
                }
            }
            return false
        }
        return searchedRecipient
    }
    
    func editRecipient(detailToBeEdited : EditRecipientEnum, recipientIdToBeEdited : Int, previousDetail : String, newDetail : String) -> Int{
        let recipient = recipients.filter{ $0.recipientID == recipientIdToBeEdited }
        var edit = 0
        switch detailToBeEdited{
        case .recipientName:
            if previousDetail.range(of: previousDetail, options: .caseInsensitive) != nil{
                recipient.filter{ if $0.name == previousDetail{
                    edit = 1
                    }
                return true
                }.first?.name = newDetail
            }
            
        case .recipientAge:
            if previousDetail.range(of: previousDetail, options: .caseInsensitive) != nil{
                recipient.filter{ if $0.recipientAge == previousDetail{
                    edit = 1
                    }
                return true
                }.first?.recipientAge = newDetail
            }
            
        case .recipientBloodGroup:
            if previousDetail.range(of: previousDetail, options: .caseInsensitive) != nil{
                recipient.filter{ if $0.recipientBloodGroup == previousDetail{
                    edit = 1
                    }
                return true
                }.first?.recipientBloodGroup = newDetail
            }
            
        case .recipientContactNumber:
            if previousDetail.range(of: previousDetail, options: .caseInsensitive) != nil{
                recipient.filter{ if $0.contactNumber == previousDetail{
                    edit = 1
                    }
                return true
                }.first?.contactNumber = newDetail
            }
            
        case .requiredAmount:
            if previousDetail.range(of: previousDetail, options: .caseInsensitive) != nil{
                recipient.filter{ if $0.requiredAmount == Int(previousDetail){
                    edit = 1
                    }
                return true
                }.first?.requiredAmount = Int(newDetail)!
            }
        }
        return edit
    }
}
