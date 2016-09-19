//
//  RepresentativeController.swift
//  MyRepresentative
//
//  Created by Wesley Austin on 9/18/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class RepresentativeController {

    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        let baseURLString = "http://whoismyrepresentative.com/getall_reps_bystate.php"
        
        let urlParameters = ["state" : state, "output": "json"]
        
        NetworkController.performRequestForURLString(baseURLString, httpMethod: .get, urlParameters: urlParameters) { (data, error) in
            
            if let error = error {
                print("Error in \(#function) - \(error.localizedDescription)")
                completion(representatives: [])
                return
            } else {
                guard let data = data,
                let repsJSON = NetworkController.jsonFromData(data),
                let repsDict = repsJSON["results"] as? [[String: AnyObject]] else { completion(representatives: []); return }
                
                let reps = repsDict.flatMap { Representative(dictionary: $0) }
                
                completion(representatives: reps)
            }
        }
    }
}

