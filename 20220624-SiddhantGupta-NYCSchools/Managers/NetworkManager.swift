//
//  NetworkManager.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/22/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import CloudKit
class NetworkManager{
    static let sharedManager = NetworkManager()

    func createURLRequest(urlString : String, completionHandler :@escaping (AFDataResponse<Data?>) -> Void){
        AF.request(urlString).response { response in
            completionHandler(response)
        }
    }
}

