//
//  ViewController.swift
//  Symba-Parse
//
//  Created by John Doty on 8/16/14.
//  Copyright (c) 2014 John Doty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    var permissions:String = ["public_profile, "email]
    

    
    @IBAction func loginFacebook(sender: AnyObject) {
        PFFacebookUtils.logInWithPermissions([""],{
            (user: PFUser!, error: NSError!) -> Void in
            if !user {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
                self.onLoginSuccess()
            } else {
                NSLog("User logged in through Facebook!")
                self.onLoginSuccess()
            }
        })
    }
    
    func onLoginSuccess(){
        let chats: AnyObject! = self.storyboard.instantiateViewControllerWithIdentifier("Chats")
        self.presentViewController(chats as UIViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var testObject = PFObject(className:"TestObject")
        testObject["name"] = "Hello World"
        testObject.saveEventually()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

