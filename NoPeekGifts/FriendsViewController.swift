//
//  SecondViewController.swift
//  NoPeekGifts
//
//  Created by Mark Gruetzner on 10/31/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FriendsViewController: UIViewController, FBSDKLoginButtonDelegate {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
    
    if (FBSDKAccessToken.currentAccessToken() == nil)
    {
        print("Not logged in")
    }
    else {
        print("Logged in")
    }
    
    let loginButton = FBSDKLoginButton()
    loginButton.readPermissions = ["public_profile", "email", "user_friends"]
    loginButton.center = self.view.center
    loginButton.delegate = self
    
    self.view.addSubview(loginButton)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error == nil)
        {
            print("Login complete")
        }
        else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }
    

}

