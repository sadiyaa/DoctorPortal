//
//  SignUpViewController.swift
//  DoctorPortal
//
//  Created by sadia masood on 3/8/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var DOB: UITextField!
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var ConfirmPassword: UITextField!
    
    
    @IBOutlet weak var labelMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: UIButton) {
        
        
        let email = self.email.text
        let password = self.password.text
        
        FIRAuth.auth()?.createUser(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
            if error == nil {
                self.labelMessage.text = "You are successfully registered"
                var ref: FIRDatabaseReference!
                
                ref = FIRDatabase.database().reference()
                ref.child("users/(user.uid)/firstname").setValue(self.firstName.text)
            }else{
                self.labelMessage.text = "Registration Failed.. Please Try Again"
            }
            
        })
    }
    
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
