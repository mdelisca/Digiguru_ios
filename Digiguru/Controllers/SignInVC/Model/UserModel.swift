//
//  UserModel.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit


class UserModel: Codable {

    var userType:UserType!
    var user_id:String!
    
    init(user_id:String? = nil,userType:UserType = .user) {
        self.userType = userType
        self.user_id = user_id
    }
    init?(dic:NSDictionary) {
        self.userType = .user
    }
}
