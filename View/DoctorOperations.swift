//
//  DoctorOperations.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 25/01/22.
//

import Foundation

extension Main{
    func getDoctorDetails() -> Doctor{
        let doctor = Doctor(doctorID: Doctor.count, name: "", specialization: "", contactNumber: "", email: "", address: [Address]())
        print("Doctor Name : ", terminator: "")
        if let userInput = readLine(){
            doctor.name = userInput
        }
        
        print("Specialization : ", terminator: "")
        if let userInput = readLine(){
            doctor.specialization = userInput
        }
        
        print("Contact Number : ", terminator: "")
        var error = 1
        repeat{
            if let userInput = readLine(){
                doctor.contactNumber = userInput
                guard doctor.contactNumber.isValidPhone() else{
                    print("Enter valid Contact Number : ", terminator: "")
                    error = 1
                    continue
                }
                error = 0
                print("Email : ", terminator: "")
                repeat{
                    if let userInput = readLine(){
                        doctor.email = userInput
                        if doctor.email != ""{
                            guard doctor.email!.isValidEmail() else{
                                print("Enter Valid Email : ", terminator: "")
                                error = 1
                                continue
                            }
                            error = 0
                            print("Address : ")
                            doctor.address.append(getAddressDetails())
                        }
                    }
                }while(error == 1)
            }
        }while(error == 1)
        Doctor.count += 1
        doctor.doctorID = Doctor.count
        return doctor
    }
    
    func setDoctorDetails(){
        var doctor = Doctor(doctorID: Doctor.count, name: "", specialization: "", contactNumber: "", email: "", address: [Address]())
        var userOperationChoice : DoctorEnum = .addDoctor
        repeat{
            print("""
                
                1. Add Doctor Details
                2. Edit Doctor Details
                3. Delete Doctor Details
                4. Exit
                """)
            if let userInput = readLine(){
                if let input = Int(userInput){
                    guard DoctorEnum(rawValue: input) != nil else{
                        print("Invalid Choice. Try Again")
                        continue
                    }
                userOperationChoice = DoctorEnum(rawValue: input)!
        switch userOperationChoice{
        case .addDoctor:
            doctor = main.getDoctorDetails()
            doctorHandler.addDoctor(doctorDetails: doctor)
        
        case .editDoctor:
            print("""
                
                1. To edit Name
                2. To edit Specialization
                3. To edit Contact Number
                4. To edit Email
                5. To edit Address
                """)
            if let userInput = readLine(){
                if let detailToBeEdited = Int(userInput){
                    let detailToBeEdited = SearchDoctorEnum.init(rawValue: detailToBeEdited)
                    var previousDetail = ""
                    var newDetail = ""
                    print("Enter the existing detail : ")
                    if let userInput = readLine(){
                        previousDetail = userInput
                        print("Enter the new detail : ")
                        if let userInput = readLine(){
                        newDetail = userInput
                            let editSucessful = doctorHandler.editDonor(doctorIdToBeEdited: doctor.doctorID, detailsToBeEdited: detailToBeEdited!, previousDetails: previousDetail, newDetails: newDetail)
                            if editSucessful == 1{
                                print("\(previousDetail) is edited as \(newDetail)")
                            }
                            else{
                                print("Not found")
                            }
                        }
                    }
                }
            }
            
        case .deleteDoctor:
            let deletedDoctor = doctorHandler.deleteDoctor(detailToBeDeleted: doctor.doctorID)
            for doctor in deletedDoctor{
                print("""
                      
                      Doctor ID : \(doctor.doctorID)
                      Name : \(doctor.name)
                      Specialization : \(doctor.specialization)
                      Contact Number : \(doctor.contactNumber)
                      Email : \(doctor.email ?? "")
                      """)
            }
            
        case .exit:
            break
        }
                    }
                }
    }while(userOperationChoice != .exit)
    }
}
