//
//  NetworkOperator.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation

//Download data from a URL and return JSON
struct NetworkOperator {
    
    var fetchURL: NSURL?
    
    init(URL: NSURL) {
        self.fetchURL = URL
    }
    
    func downloadUserData(completion: NSArray -> ()) {
        //config
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        //request
        let request = NSURLRequest(URL: self.fetchURL!)
        
        //session
        let session = NSURLSession(configuration: config)
        
        //task
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSArray
                completion(json!)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
