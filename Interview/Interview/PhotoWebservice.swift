//
//  PhotoWebservice.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation

struct PhotoService {
    
    //URL
    private static let baseURL = "http://jsonplaceholder.typicode.com/photos"
    
    //Constructs the URL
    private static func constructURL() -> NSURL? {
        //Base URL
        let photoURLComponent = NSURLComponents(string: baseURL)
        
        //Returns the complete URL
        return(photoURLComponent?.URL)
    }
    
    //Parses the received JSON, models the data and returns
    //the  model object
    // Parse the data, model it and send to VC.
    static func fetchAllPhotos(completion: [Photo]? -> Void) {
        
        var photo = Photo()
        var photos = [Photo]()
        let url = constructURL()
        let nwOperator = NetworkOperator(URL: url!)
        nwOperator.downloadUserData { (array) -> Void in
            for item in (array as? [[String: AnyObject]])! {
                
                guard let url = item["url"] as? String,
                    let thumbnailURL = item["thumbnailUrl"] as? String
                    else {
                        return
                }
                
                photo.url = url
                photo.thumbnailURL = thumbnailURL
                
                photos.append(photo)
            }
            completion(photos)
        }
    }
}