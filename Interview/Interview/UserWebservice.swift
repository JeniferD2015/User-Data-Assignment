//
//  UserWebservice.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation
import UIKit

struct UserWebservice {
    // Constructs the URL
    static func constructURL() -> NSURL? {
        let urlString = "http://jsonplaceholder.typicode.com/users"
        let url = NSURL(string: urlString)
        return url
    }
    // Parse the data, model it and send to VC.
    static func fetchAllUsers(completion: [User]? -> Void) {
        
        var user = User()
        var users = [User]()
        let url = constructURL()
        let nwOperator = NetworkOperator(URL: url!)
        nwOperator.downloadUserData { (array) -> Void in
            for item in (array as? [[String: AnyObject]])! {
                
                guard let name = item["name"] as? String,
                    let userEmail = item["email"] as? String,
                    let userName = item["username"] as? String,
                    let phone = item["phone"] as? String,
                    let website = item["website"] as? String,
                    let address = item["address"],
                    let company = item["company"]
                    else {
                        return
                }
                
                user.name = name
                user.userName = userName
                user.userEmail = userEmail
                user.phone = phone
                user.website = website
                user.address = address as? [String : AnyObject]
                user.company = company as? [String : String]
                
                users.append(user)
            }
            completion(users)
        }
    }
}
