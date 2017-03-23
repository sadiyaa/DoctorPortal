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
import ActionSheetPicker_3_0

class SignUpViewController: UIViewController {

    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var DOB: UITextField!
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var ConfirmPassword: UITextField!
    
    
    @IBOutlet var patientDoctor: UIButton!
    
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
                let usersRef = ref.child("users")
                let userRef = usersRef.child((user?.uid)!)
                let userFirstName = userRef.child("firstname")
                userFirstName.setValue(self.firstName.text)
                let lastName = userRef.child("lastname")
                lastName.setValue(self.lastName.text)
                let dateofbirth = userRef.child("dateofbirth")
                dateofbirth.setValue(self.DOB.text)
                let emailAddress = userRef.child("emailAddress")
                emailAddress.setValue(self.email.text)
//                let patient = userRef.child("patient")
//                patient.setValue(self.patient.text)
            }else{
                self.labelMessage.text = "Registration Failed.. Please Try Again"
            }
            
        })
        
    }
    
        
    @IBAction func patientdoctor(_ sender: UIButton) {
       
//   var colors: [String] = ["Red", "Green", "Blue", "Orange"]
//   
//        ActionSheetStringPicker.show(withTitle: "Select Leave Type", rows: colors: initialSelection: 0, doneBlock: {(_ picker: ActionSheetStringPicker, _ selectedIndex: Int, id selectedvalue) -> Void in
//    
//    
//    self.patientDoctor.setTitle(selectedValue, for: .normal)
//    
//    _leaveType = selectedValue
//    
//    
//}, cancelBlock: {(_ picker: ActionSheetStringPicker) -> Void in
//}, origin: sender)
        
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
