//
//  ColorUtility.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//



import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor {
        
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        let randomAlpha = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue:randomBlue, alpha: randomAlpha)
    }
    
    static func randomLightColor() -> UIColor {
        
        return UIColor(red: 74/255.0, green: 144/255.0, blue:126/255.0, alpha: 0.9)
    }
    
    static func colorForCell() -> UIColor {
    
    return UIColor(red: 255/255.0, green: 250/255.0, blue:250/255.0, alpha: 0.9)

    
    }
    
}