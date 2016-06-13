//
//  DetailViewController.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedUser = User()
    var selectedPhoto : Photo!
    
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        
        setupUI()
        
    }
    
    func setupUI() {
        
        self.title = selectedUser.name
        
        let userImage = "FullSizeRender.png"
        let image = UIImage(named: userImage)
        let imgView = UIImageView(image: image!)
 
        let url = NSURL(string: selectedPhoto.url!)
        let data = NSData(contentsOfURL: url!)
        imgView.image  = UIImage(data: data!)
        imgView.frame = CGRect(x: 0, y: 30, width: 400, height: 250)
        imgView.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.view.addSubview(imgView)
        
        let namelabel = UILabel(frame: CGRectMake(20,300,0,0))
        namelabel.textAlignment = NSTextAlignment.Left
        namelabel.text = "Name: \((selectedUser.name)!)"
        namelabel.textColor = UIColor.blueColor()
        namelabel.font = UIFont.boldSystemFontOfSize(20)
          namelabel.sizeToFit()
        UIView.animateWithDuration(0.6, delay: 1.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            
            namelabel.center = CGPoint(x: 200, y:180 )
            
            
            }, completion: nil)

      
       
        self.view.addSubview(namelabel)
        
        let userNamelabel = UILabel(frame: CGRectMake(20,320,0,0))
        
        userNamelabel.text = "Username: \((selectedUser.userName)!)"
        userNamelabel.font = UIFont.boldSystemFontOfSize(14)
        userNamelabel.sizeToFit()
        userNamelabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(userNamelabel)

    
        let emaillabel = UILabel(frame: CGRectMake(20,340,0,0))
        emaillabel.textAlignment = NSTextAlignment.Left
        emaillabel.text = "Email Address: \((selectedUser.userEmail)!)"
        emaillabel.font = UIFont.boldSystemFontOfSize(14)
        emaillabel.sizeToFit()
        emaillabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(emaillabel)
        
        let addressLabel = UILabel(frame: CGRectMake(20,380,0,0))
        addressLabel.textAlignment = NSTextAlignment.Left
        addressLabel.text = "Address"
        addressLabel.font = UIFont.boldSystemFontOfSize(14)
        addressLabel.sizeToFit()
        addressLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(addressLabel)
        
        let streetLabel = UILabel(frame: CGRectMake(20,400,0,0))
        streetLabel.textAlignment = NSTextAlignment.Left
        streetLabel.text = "Street: \((selectedUser.address!["street"])!)"
        streetLabel.font = UIFont.boldSystemFontOfSize(14)
        streetLabel.sizeToFit()
        streetLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(streetLabel)
        
        let suiteLabel = UILabel(frame: CGRectMake(20,420,0,0))
        suiteLabel.textAlignment = NSTextAlignment.Left
        suiteLabel.text = "Suite: \((selectedUser.address!["suite"])!)"
        suiteLabel.font = UIFont.boldSystemFontOfSize(14)
        suiteLabel.sizeToFit()
        suiteLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(suiteLabel)
        
        let cityLabel = UILabel(frame: CGRectMake(20,440,0,0))
        cityLabel.textAlignment = NSTextAlignment.Left
        cityLabel.text = "City: \((selectedUser.address!["city"])!)"
        cityLabel.font = UIFont.boldSystemFontOfSize(14)
        cityLabel.sizeToFit()
        cityLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(cityLabel)
        
        let zipLabel = UILabel(frame: CGRectMake(20,460,0,0))
        zipLabel.textAlignment = NSTextAlignment.Left
        zipLabel.text = "Zipcode: \((selectedUser.address!["zipcode"])!)"
        zipLabel.font = UIFont.boldSystemFontOfSize(14)
        zipLabel.sizeToFit()
        zipLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(zipLabel)
        
        let companyLabel = UILabel(frame: CGRectMake(20,500,0,0))
        companyLabel.textAlignment = NSTextAlignment.Left
        companyLabel.text = "Company Details"
        companyLabel.font = UIFont.boldSystemFontOfSize(14)
        companyLabel.sizeToFit()
        companyLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(companyLabel)
        
        let companyNameLabel = UILabel(frame: CGRectMake(20,520,0,0))
        companyNameLabel.textAlignment = NSTextAlignment.Left
        companyNameLabel.text = "Name: \((selectedUser.company!["name"])!)"
        companyNameLabel.font = UIFont.boldSystemFontOfSize(14)
        companyNameLabel.sizeToFit()
        companyNameLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(companyNameLabel)
        
        let catchPhraseLabel = UILabel(frame: CGRectMake(20,540,0,0))
        catchPhraseLabel.textAlignment = NSTextAlignment.Left
        catchPhraseLabel.text = "City: \((selectedUser.company!["catchPhrase"])!)"
        catchPhraseLabel.font = UIFont.boldSystemFontOfSize(14)
        catchPhraseLabel.sizeToFit()
        catchPhraseLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(catchPhraseLabel)
        
        let bsLabel = UILabel(frame: CGRectMake(20,560,0,0))
        bsLabel.textAlignment = NSTextAlignment.Left
        bsLabel.text = "BS: \((selectedUser.company!["bs"])!)"
        bsLabel.font = UIFont.boldSystemFontOfSize(14)
        bsLabel.sizeToFit()
        bsLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(bsLabel)
        
        let phoneLabel = UILabel(frame: CGRectMake(20,600,0,0))
        phoneLabel.textAlignment = NSTextAlignment.Left
        phoneLabel.text = "Phone: \((selectedUser.phone)!)"
        phoneLabel.font = UIFont.boldSystemFontOfSize(14)
        phoneLabel.sizeToFit()
        phoneLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(phoneLabel)
        
        let websiteLabel = UILabel(frame: CGRectMake(20,620,0,0))
        websiteLabel.textAlignment = NSTextAlignment.Left
        websiteLabel.text = "Website: \((selectedUser.website)!)"
        websiteLabel.font = UIFont.boldSystemFontOfSize(14)
        websiteLabel.sizeToFit()
        websiteLabel.textColor = UIColor.randomLightColor()
        self.view.addSubview(websiteLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}