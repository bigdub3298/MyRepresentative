//
//  Representative.swift
//  MyRepresentative
//
//  Created by Wesley Austin on 9/17/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class Representative {
    
    let name : String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init(name: String, party: String, state: String, district: String, phone: String, office: String, link: String) {
        self.name = name
        if party == "R" {
            self.party = "Republican"
        } else {
            self.party = "Democrat"
        }
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
    
    convenience init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String,
        let party = dictionary["party"] as? String,
        let state = dictionary["state"] as? String,
        let district = dictionary["district"] as? String,
        let phone = dictionary["phone"] as? String,
        let office = dictionary["office"] as? String,
            let link = dictionary["link"] as? String else { return nil }
        
        self.init(name: name, party: party, state: state, district: district, phone: phone, office: office, link: link)
    }
}
