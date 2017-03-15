//
//  ViewController.swift
//  DoctorPortal
//
//  Created by sadia masood on 3/8/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ViewController: UIViewController {
    
    
    @IBOutlet var UserName: UITextField!

    @IBOutlet var Password: UITextField!
    
    @IBOutlet var SignIn: UIButton!
   
    @IBOutlet var SignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

    @IBAction func sign(_ sender: UIButton) {
        
        if self.UserName.text == "" || self.Password.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.UserName.text!, password: self.Password.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                    self.performSegue(withIdentifier: "Home", sender: self)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

        
        
    
    @IBAction func createaccount(_ sender: UIButton) {
        
        
        self.performSegue(withIdentifier: "signup", sender:self)
    }


    @IBAction func facebookLogin(_ sender: UIButton) {
        
        
        
            let fbLoginManager = FBSDKLoginManager()
            fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
                if let error = error {
                    print("Failed to login: \(error.localizedDescription)")
                    return
                }
                
                guard let accessToken = FBSDKAccessToken.current() else {
                    print("Failed to get access token")
                    return
                }
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                
                // Perform login by calling Firebase APIs
                FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                    if let error = error {
                        print("Login error: \(error.localizedDescription)")
                        let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(okayAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        return
                    }
                    
                    // Present the main view
                    if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "facebook") {
                        UIApplication.shared.keyWindow?.rootViewController = viewController
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                })
                
            }
}
}


        







    
    
        



        
    

    



