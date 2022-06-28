//
//  SATManager.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/23/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import CloudKit
class SATManager{
    static let sharedManager = SATManager()
    
    var schoolsSATList : Dictionary<String, SchoolSAT> =  [:]
    
    func reloadSATList(completionHandler :@escaping (Bool) -> Void){
        
        let URLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        
        NetworkManager.sharedManager.createURLRequest(urlString: URLString) { response in
            if response.data != nil {
                do{
                    let JSONdata = try JSON(data: response.data!)
                    self.processSATInfo(JSONArray: JSONdata.arrayValue)
                }
                catch{
                    print("exception")
                    completionHandler(false)
                }
            }else{
                completionHandler(false)
            }
            completionHandler(true)
        }
        
    }
    
    func processSATInfo(JSONArray : Array<JSON>){   // Processing schools list for relevant information
        
        for index in 0 ..< (JSONArray.count){
            let currentSchoolSAT = JSONArray[index]
            let schoolSAT : SchoolSAT = SchoolSAT()
            schoolSAT.initWithDictionary(schoolSATInfo: currentSchoolSAT)
            self.schoolsSATList[schoolSAT.DBN] = schoolSAT
        }
    }
    

    func getSATForDBN(dbn : String) -> SchoolSAT{
        return schoolsSATList[dbn] ?? SchoolSAT()
    }

}
