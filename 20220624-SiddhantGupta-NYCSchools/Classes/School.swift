//
//  School.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/22/22.
//

import Foundation
import SwiftyJSON

class School : NSObject{
    
    @objc var schoolName : String = ""
    @objc var address : String = ""
    @objc var city : String = ""
    @objc var neighborhood : String = ""
    @objc var postalCode : String = ""
    @objc var overview : String = ""
    @objc var website : String = ""

    var DBN : String = ""

    
    func initWithDictionary(schoolInfo : JSON){
        let schoolDict = schoolInfo.dictionaryValue
        self.DBN = schoolDict["dbn"]?.stringValue ?? ""
        self.schoolName = schoolDict["school_name"]?.stringValue ?? ""
        self.address = schoolDict["primary_address_line_1"]?.stringValue ?? ""
        self.city = schoolDict["city"]?.stringValue ?? ""
        self.neighborhood = schoolDict["neighborhood"]?.stringValue ?? ""
        self.postalCode = schoolDict["zip"]?.stringValue ?? ""
        self.overview = schoolDict["overview_paragraph"]?.stringValue ?? ""
        self.website = schoolDict["website"]?.stringValue ?? ""
        
    }
}
