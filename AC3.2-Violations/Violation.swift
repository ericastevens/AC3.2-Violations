//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Erica Y Stevens on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
    let action: String
    let boro: String
    let buildingNumber: String
    let streetName: String
    let zipcode: String
    let criticalFlag: String
    let cuisineDescription: String
    let dba: String
    let inspectionDate: String
    let inspectionType: String
    let phoneNumber: String
    let score: String
    let violationCode: String
    let violationDescription: String
    let recordDate: String
    
    init(action: String, boro: String, buildingNumber: String, streetName: String, zipcode: String, criticalFlag: String, cuisineDescription: String, dba: String, inspectionDate: String, inspectionType: String, phoneNumber: String, score: String, violationCode: String, violationDescription: String, recordDate: String) {
        self.action = action
        self.boro = boro
        self.buildingNumber = buildingNumber
        self.streetName = streetName
        self.zipcode = zipcode
        self.criticalFlag = criticalFlag
        self.cuisineDescription = cuisineDescription
        self.dba = dba
        self.inspectionDate = inspectionDate
        self.inspectionType = inspectionType
        self.phoneNumber = phoneNumber
        self.score = score
        self.violationCode = violationCode
        self.violationDescription = violationDescription
        self.recordDate = recordDate
    }
    
    convenience init?(withDict dict: [String:String]) {
        if let action = dict["action"],
        let boro = dict["boro"],
        let buildingNumber = dict["building"],
        let streetName = dict["street"],
        let zipcode = dict["zipcode"],
        let criticalFlag = dict["critical_flag"],
        let cuisineDescription = dict["cuisine_description"],
        let dba = dict["dba"],
        let inspectionDate = dict["inspection_date"],
        let inspectionType = dict["inspection_type"],
        let phoneNumber = dict["phone"],
        let score = dict["score"],
        let violationCode = dict["violation_code"],
        let violationDescription = dict["violation_description"],
            let recordDate = dict["record_date"] {
            self.init(action: action, boro: boro, buildingNumber: buildingNumber, streetName: streetName, zipcode: zipcode, criticalFlag: criticalFlag, cuisineDescription: cuisineDescription, dba: dba, inspectionDate: inspectionDate, inspectionType: inspectionType, phoneNumber: phoneNumber, score: score, violationCode: violationCode, violationDescription: violationDescription, recordDate:recordDate)
        }
        else {
            return nil
        }
    }
}
