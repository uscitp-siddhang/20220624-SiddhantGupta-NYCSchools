//
//  SchoolSAT.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/23/22.
//

import Foundation
import SwiftyJSON

class SchoolSAT : NSObject{

    var DBN : String = ""
    @objc var schoolName : String = ""
    @objc var reading : String = "Unavailable"
    @objc var writing : String = "Unavailable"
    @objc var math : String = "Unavailable"
    @objc var numTakers : String = "Unavailable"
    
    func initWithDictionary(schoolSATInfo : JSON){
        let schoolSATInfoDict = schoolSATInfo.dictionaryValue
        self.DBN = schoolSATInfoDict["dbn"]?.stringValue ?? ""
        self.schoolName = schoolSATInfoDict["school_name"]?.stringValue ?? ""
        self.reading = schoolSATInfoDict["sat_critical_reading_avg_score"]?.stringValue ?? "Unavailable"
        self.writing = schoolSATInfoDict["sat_writing_avg_score"]?.stringValue ?? "Unavailable"
        self.math = schoolSATInfoDict["sat_math_avg_score"]?.stringValue ?? "Unavailable"
        self.numTakers = schoolSATInfoDict["num_of_sat_test_takers"]?.stringValue ?? "Unavailable"
    }
}

