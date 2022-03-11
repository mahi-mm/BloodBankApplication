//
//  GetHospitalDetails.swift
//  BloodBankApp
//
//  Created by MAHIMA M on 29/12/21.
//

import Foundation

extension Main{
    func getHospitalDetails() -> Hospital{
        let hospital = Hospital(hospitalName: "", hospitalContactNumber: "", hospitalAddress: [Address](), patient: [Patient](), doctor: [Doctor]())
        print("Hospital Name : ", terminator: "")
        if let userInput = readLine(){
            hospital.name = userInput
        }
        print("Hospital Contact Number : ", terminator: "")
        var error = 1
        repeat{
            if let userInput = readLine(){
                hospital.contactNumber = userInput
                guard hospital.contactNumber.isValidPhone() else{
                    print("Enter valid Contact Number : ", terminator: "")
                    error = 1
                    continue
                }
                error = 0
                print("Hospital Address : ")
                hospital.address.append(getAddressDetails())
                
            }
        }while(error == 1)
        return hospital
    }
    
    func setHospitalDetails(userDetails : UserRegistration){
        let hospitalHandler = HospitalHandler()
        var hospitalDetails = Hospital(hospitalName: "", hospitalContactNumber: "", hospitalAddress: [Address](), patient: [Patient](), doctor: [Doctor]())
        let patientDetails = Patient(donor: [Donor](), recipient: [Recipient]())
        var hospitalOperationChoice : HospitalOperationEnum = .addHospital
        repeat{
            print("""
                
                1. Add Hospital
                2. Add/Edit Doctor
                3. List Doctors
                4. Add/Edit Recipient
                5. List Recipients
                6. Accept Blood
                7. Donate Blood
                8. Exit
                """)
            if let userInput = readLine(){
                if let input = Int(userInput){
                    guard HospitalOperationEnum(rawValue: input) != nil else{
                        print("Invalid Choice. Try Again")
                        continue
                    }
                hospitalOperationChoice = HospitalOperationEnum(rawValue: input)!
                    switch hospitalOperationChoice{
                    case .addHospital:
                        hospitalDetails = getHospitalDetails()
                        hospitalHandler.addHospital(hospital: hospitalDetails)
                        
                    case .addRecipient:
                        let doctorsList = doctorHandler.listDoctor()
                        if doctorsList.count == 0{
                            print("No doctors available. Please wait.")
                            break
                        }
                        patientDetails.recipeint.append(setRecipientDetails(listOfDoctors: doctorsList))
                        
                    case .listRecipients:
                        let recipients = recipientHandler.listRecipient()
                        if recipients.isEmpty{
                            print("Not found")
                        }
                        for recipient in recipients{
                            print("""
                                
                                Name : \(recipient.name)
                                Age : \(recipient.recipientAge)
                                Blood Group : \(recipient.recipientBloodGroup)
                                Required Amount : \(recipient.requiredAmount)
                                Contact Number : \(recipient.contactNumber)
                                """)
                            for address in recipient.address{
                                displayAddress(address: address)
                            }
                        }
                     
                     case .addDoctor:
                        setDoctorDetails()
                        
                     case .listDoctors:
                        let doctorsList = doctorHandler.listDoctor()
                        for doctors in doctorsList{
                            print("""
                                  
                                  Name : \(doctors.name)
                                  Specialization : \(doctors.specialization)
                                  Contact Number : \(doctors.contactNumber)
                                  Email : \(doctors.email ?? "")
                                  """)
                            for address in doctors.address{
                                displayAddress(address: address)
                            }
                        }
                        
                     case .acceptBlood:
                        let availableBloodBanks = bloodBankHandler.listBloodBank()
                        if availableBloodBanks.count == 0{
                            print("No Blood Banks available.")
                            break
                        }
                        else{
                            for bloodBank in availableBloodBanks{
                                print("""
                                      
                                      Blood Bank ID : \(bloodBank.bloodBankID)
                                      Name : \(bloodBank.name)
                                      Contact Number : \(bloodBank.contactNumber)
                                      """)
                                for address in bloodBank.address{
                                    displayAddress(address: address)
                                }
                        }
                        print("Enter the Blood Bank ID in which you wish to donate blood")
                        if let userInput = readLine(){
                            if let id = Int(userInput){
                                let availableBloodBanks = bloodBankHandler.searchBloodBank(bloodBankID: id)
                                
                                let orderDetails = getOrderDetails()
                                var orderStatus = adminHandler.setOrderDetails(bloodBank: availableBloodBanks, requiredBloodGroup: orderDetails.requiredBloodGroup, quantityOfBlood: orderDetails.quantityOfBlood, deliveryAddress: orderDetails.deliveryAddress)
                        if orderStatus == "Not enough Stock. Please Wait..!!"{
                            let eligibleBloodGroups = bloodTyping(bloodGroup: orderDetails.requiredBloodGroup)
                            let searchedValue = donorRequest(requiredUnits : orderDetails.quantityOfBlood, deliveryAddress: orderDetails.deliveryAddress, requiredBloodGroup : eligibleBloodGroups)
                            if searchedValue.count == 0{
                                print("No donors available")
                            }
                            else{
                                print("Please contact the following Donors.")
                                print("Donors List : ")
                                for details in searchedValue{
                                    print("""
                                        
                                        Donor ID : \(details.donorID)
                                        Donor Name : \(details.personalDetails.name)
                                        Donor Blood Group : \(details.personalDetails.donorBloodGroup)
                                        Donor Gender : \(details.personalDetails.donorGender)
                                        Donor Contact Number : \(details.personalDetails.contactNumber)
                                        Donor Email : \(details.personalDetails.email ?? "")
                                        """)
                                    for address in details.personalDetails.address{
                                        displayAddress(address: address)
                                    }
                                }
                                    }
                                }
                                else{
                                    print("""
                                          
                                          \(orderStatus)
                                          
                                          """)
                                    print("Delivery Address : ")
                                    orderDetails.deliveryAddress.append(getAddressDetails())
                                    print("""
                                          
                                          Blood Group : \(orderDetails.requiredBloodGroup)
                                          Required Quantity : \(orderDetails.quantityOfBlood)
                                          Would you like to place your order ? Enter Y to place the order, else enter N.
                                          """)
                                    if let userInput = readLine(){
                                        guard userInput == "Y" else{
                                            break
                                        }
                                    orderStatus = adminHandler.setOrderDetails(bloodBank: availableBloodBanks, requiredBloodGroup: orderDetails.requiredBloodGroup, quantityOfBlood: orderDetails.quantityOfBlood, deliveryAddress: orderDetails.deliveryAddress)
                                    
                                    print("""
                                          
                                          Blood Group : \(orderDetails.requiredBloodGroup)
                                          Required Quantity : \(orderDetails.quantityOfBlood)
                                          """)
                                    print("Order Placed. Thank You")
                                    }
                                }
                            }
                        }
                    }
                        
                    case .donateBlood:
                        let userDetails = setUserDetails(userType: .donor)
                        setDonorDetails(username: userDetails)
                        
                        
                    case .exit:
                        break
                    }
                }
            }
        }while(hospitalOperationChoice != .exit)
    }
}
