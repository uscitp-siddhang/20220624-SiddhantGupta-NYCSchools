//
//  SchoolsListManager.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/22/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import CloudKit
class SchoolsListManager{
    static let sharedManager = SchoolsListManager()
    var schoolsList : Array<School> =  []
    
    func reloadSchoolsList(completionHandler :@escaping (Bool) -> Void){
        
        let URLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        
        NetworkManager.sharedManager.createURLRequest(urlString: URLString) { response in
            if let responseData = response.data {
                do{
                    let JSONdata = try JSON(data: responseData)
                    self.processSchoolInfo(JSONArray: JSONdata.arrayValue)
                }
                catch{
                    print("exception")
                    completionHandler(false)
                }
            }
            completionHandler(true)
        }
        
    }
    
    func processSchoolInfo(JSONArray : Array<JSON>){   // Processing schools list for relevant information
        
        for index in 0 ..< (JSONArray.count){
            let currentSchool = JSONArray[index]
            let school : School = School()
            school.initWithDictionary(schoolInfo: currentSchool)
            self.schoolsList.append(school)
        }
    }
    //MARK: Return methods
    func getSchoolsList() -> Array<School>?{
        return schoolsList
    }
    
    func getSchoolsCount() -> Int{
        return self.schoolsList.count
    }
    
    func getSchoolAtIndex(schoolIndex: Int) -> School{
        return schoolsList[schoolIndex]
    }

}
