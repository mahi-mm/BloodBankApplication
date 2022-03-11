//
//  DonorHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class DonorHandler{
    var donors = [Donor]()
    var historyHandler = HistoryHandler()
    var patientHandler = PatientHandler()
    var donorsList = [Donor]()
    var bloodDonatedDate = [Date]()
    
    func addDonor(addDonor : Donor) {
        historyHandler.addHistory(addHistory: [addDonor.previousHistory], userID: addDonor.donorID)
        donors.append(addDonor)
        patientHandler.addDonors(addDonors: [addDonor])
    }
    
    func addHistory(addHistoryDetails : [PreviousHistory], user : Int){
        historyHandler.addHistory(addHistory: addHistoryDetails, userID : user)
    }
    
    func listDonor(userID : Int) -> [Donor]{
        var donorHistory = [Donor]()
        var filtered = [Donor]()
        let history = historyHandler.listHistory(userID: userID)
        for details in history{
            filtered = donors.filter{ $0.donorID == userID}
            for donors in filtered{
                donorHistory.append(Donor(donorID: userID, personalDetails: donors.personalDetails, previousHistory: PreviousHistory(labReports: details.labReports, requirements: details.requirements)))
            }
        }
        return donorHistory
    }
    
    func searchDonor(searchFor : SearchDonorEnum, searchValue : String) -> [Donor]{
        var filtered = [Donor]()
        switch searchFor{
        case .donorID:
            if searchValue.range(of: searchValue, options: .caseInsensitive) != nil{
                filtered = donors.filter{ $0.donorID == Int(searchValue)}
                return filtered
            }
            
        case .donorName:
            if searchValue.range(of: searchValue, options: .caseInsensitive) != nil{
                filtered = donors.filter{ $0.personalDetails.name == searchValue}
                return filtered
            }
        
        case .donorBloodGroup:
            if searchValue.range(of: searchValue, options: .caseInsensitive) != nil{
                filtered = donors.filter{ $0.personalDetails.donorBloodGroup == searchValue}
                return filtered
            }
        
        default:
            break
        }
        return filtered
    }
    
    func editDonor(donorIdToBeEdited : Int, detailsToBeEdited : SearchDonorEnum, previousDetails : String, newDetails : String) -> Int{
        var edit = 0
        let donor = donors.filter{ $0.donorID == donorIdToBeEdited }
        switch detailsToBeEdited{
        case .donorName:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.name == previousDetails{
                    edit = 1
                    }
                return true
                }.first?.personalDetails.name = newDetails
            }
            
        case .donorBloodGroup:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.donorBloodGroup == previousDetails{
                    edit = 1
                    }
                return true
                }.first?.personalDetails.donorBloodGroup = newDetails
            }
        
        case .donorGender:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.donorGender == previousDetails{
                    edit = 1
                    }
                return true
                }.first?.personalDetails.donorGender = newDetails
            }
            
        case .donorAge:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.donorAge == Int(previousDetails){
                    edit = 1
                    }
                return true
                }.first?.personalDetails.donorAge = Int(newDetails)!
            }
            
        case .donorEmail:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.email == previousDetails{
                    edit = 1
                    }
                return true
                }.first?.personalDetails.email = newDetails
            }
            
        case .donorContact:
            if previousDetails.range(of: previousDetails, options: .caseInsensitive) != nil{
                donor.filter{ if $0.personalDetails.contactNumber == previousDetails{
                    edit = 1
                    }
                return true
                }.first?.personalDetails.contactNumber = newDetails
            }
        
        default:
            break
        }
        return edit
    }
    
    func deleteDonor(detailToBeDeleted : Int) -> [Donor]{
        var deletedDonor = [Donor]()
        for (index,donor) in donors.enumerated(){
            if donor.donorID == detailToBeDeleted{
                deletedDonor.append(donors.remove(at: index))
            }
        }
        return deletedDonor
    }
        
    func donateBlood(donorID : Int, donor : [Donor], date : String) -> [Donor]{
        let filtered = donors.filter{ $0.donorID == donorID}
        for details in filtered{
            details.donationDate = date
        }
        donorsList.append(contentsOf : donor)
        return donorsList
    }
    
    func viewRecentDonationHistory(donorID : Int) -> [Donor]{
        let filtered = donorsList.filter{ $0.donorID == donorID}
        return filtered
    }
    
    func requestDonors(requiredUnits : Int, address : [Address], requiredBloodGroup : [String]) -> [Donor]{
        var searchedValue = [Address]()
        var pincode = ""
        var city = ""
        var district = ""
        var state = ""
        var availableDonors = [Donor]()
        let filtered = donorsList.filter{requiredBloodGroup.contains($0.personalDetails.donorBloodGroup)}
        for addresses in address{
            guard addresses.pincode.range(of: addresses.pincode, options: .caseInsensitive) != nil else{
                break
            }
            guard addresses.city.range(of: addresses.city, options: .caseInsensitive) != nil else{
                break
            }
            guard addresses.district.range(of: addresses.district, options: .caseInsensitive) != nil else{
                break
            }
            guard addresses.state.range(of: addresses.state, options: .caseInsensitive) != nil else{
                break
            }
            pincode = addresses.pincode
            city = addresses.city
            district = addresses.district
            state = addresses.state
        }
        for details in filtered{
            searchedValue = details.personalDetails.address.filter{ $0.pincode == pincode}
        }
        availableDonors.append(contentsOf : donorsList.filter{$0.personalDetails.address == searchedValue})
        if filtered.count >= requiredUnits{
            return availableDonors
        }
        else{
            for details in filtered{
                searchedValue = details.personalDetails.address.filter{ $0.city == city}
                availableDonors.append(contentsOf : donorsList.filter{$0.personalDetails.address == searchedValue})
                if filtered.count >= requiredUnits{
                    return availableDonors
                }
                else{
                    for details in filtered{
                        searchedValue = details.personalDetails.address.filter{ $0.district == district}
                        availableDonors.append(contentsOf : donorsList.filter{$0.personalDetails.address == searchedValue})
                    }
                    if filtered.count >= requiredUnits{
                        return availableDonors
                    }
                    else{
                        for details in filtered{
                            searchedValue = details.personalDetails.address.filter{ $0.state == state}
                            availableDonors.append(contentsOf : donorsList.filter{$0.personalDetails.address == searchedValue})
                        }
                        if filtered.count >= requiredUnits{
                            return availableDonors
                        }
                    }
                }
            }
        }
        return availableDonors
    }
    
    func donorCheerPoints(donorId : Int) -> (String, Int){
        let filtered = donorsList.filter{ $0.donorID == donorId }
        for details in filtered{
            if Donor.numberOfDonations >= 2{
                details.cheerPoints += 50
                return (details.personalDetails.name, details.cheerPoints)
            }
        }
        return ("", 0)
    }
}
