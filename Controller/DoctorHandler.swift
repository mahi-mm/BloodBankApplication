//
//  DoctorHandler.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 09/03/22.
//

import Foundation

class DoctorHandler{
    var doctorArray = [Doctor]()
    var patientHandler = PatientHandler()
    
    func addDoctor(doctorDetails : Doctor){
        doctorArray.append(doctorDetails)
    }
    
    func listDoctor() -> [Doctor]{
        return doctorArray
    }

    func searchDoctor(searchFor : SearchDoctorEnum, searchValue : String) -> [Doctor]{
        var filtered = [Doctor]()
        switch searchFor{
        case .doctorID:
            filtered = doctorArray.filter{ $0.doctorID == Int(searchValue)}
            return filtered
            
        case .doctorName:
            filtered = doctorArray.filter{ $0.name == searchValue}
            return filtered
        
        case .specialization:
            filtered = doctorArray.filter{ $0.specialization == searchValue}
            return filtered
        
        case .contactNumber:
            filtered = doctorArray.filter{ $0.contactNumber == searchValue}
            
        case .email:
            filtered = doctorArray.filter{ $0.email == searchValue}
        }
        return filtered
    }
    
    func editDonor(doctorIdToBeEdited : Int, detailsToBeEdited : SearchDoctorEnum, previousDetails : String, newDetails : String) -> Int{
        var edit = 0
        let doctor = doctorArray.filter{ $0.doctorID == doctorIdToBeEdited }
        switch detailsToBeEdited{
        case .doctorName:
            doctor.filter{ if $0.name == previousDetails{
                edit = 1
                }
            return true
            }.first?.name = newDetails
            
        case .specialization:
            doctor.filter{ if $0.specialization == previousDetails{
                edit = 1
                }
            return true
            }.first?.specialization = newDetails
        
        case .contactNumber:
            doctor.filter{ if $0.contactNumber == previousDetails{
                edit = 1
                }
            return true
            }.first?.contactNumber = newDetails
            
        case .email:
            doctor.filter{ if $0.email == previousDetails{
                edit = 1
                }
            return true
            }.first?.email = newDetails
            
        default:
            break
        }
        return edit
    }
    
    func deleteDoctor(detailToBeDeleted : Int) -> [Doctor]{
        var deletedDoctor = [Doctor]()
        for (index,doctor) in doctorArray.enumerated(){
            if doctor.doctorID == detailToBeDeleted{
                deletedDoctor.append(doctorArray.remove(at: index))
            }
        }
        return deletedDoctor
        
    }
}
