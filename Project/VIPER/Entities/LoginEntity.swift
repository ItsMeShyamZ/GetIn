//
//  LoginEntity.swift
//  Project
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginReq : Codable{
    var device_type : String = "iOS"
    var device_token  : String = ""
    var device_id  : String? = ""
    var client_id : Int = appClientId
    var client_secret : String = appSecretKey
    var grant_type : String = "password"
    var username : String?
    var password : String?
}

struct LoginEntity : Mappable {
    var token_type : String?
    var expires_in : Int?
    var access_token : String?
    var refresh_token : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        token_type <- map["token_type"]
        expires_in <- map["expires_in"]
        access_token <- map["access_token"]
        refresh_token <- map["refresh_token"]
    }
    
}
