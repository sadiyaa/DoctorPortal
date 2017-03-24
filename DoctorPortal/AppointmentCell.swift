//
//  AppointmentCell.swift
//  DoctorPortal
//
//  Created by Masood Qureshi on 3/16/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import MessageUI
import Firebase
import FirebaseAuth
import FirebaseDatabase
import ActionSheetPicker_3_0

class AppointmentCell: UITableViewCell, UIPickerViewDelegate,UIPickerViewDataSource, MFMessageComposeViewControllerDelegate {
    
   
  
    @IBOutlet var picker: UIPickerView!
    
   
    @IBOutlet var label: UILabel!
    
   
    
   var pickerData: [String] = [String]()
    
    var viewcontroller = UIViewController()
    
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        picker?.delegate = self
        picker?.dataSource = self
         picker = UIPickerView()
        
      pickerData = ["9:00 9:30","10:00 10:30","10:30 11:00"]
        
        
        
        var ref: FIRDatabaseReference!
        
        ref = FIRDatabase.database().reference()
        
        let appointment = ref.child("Appoinemnt")
        
        let newappointment = appointment.childByAutoId()
        let AppointmentDate = appointment.child("AppointmentDate")
       AppointmentDate.setValue(self.label.text)
      
        let userId = FIRAuth.auth()?.currentUser?.uid
        let appointmentUserId = newappointment.child("userId");
        appointmentUserId.setValue(userId);
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        label.text = pickerData[row]
        
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      // label.text = "select"
    
    }
    
    
    
    @IBAction func schedule(_ sender: UIButton) {
        
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            let phoneNumer = String()
            
            controller.body = label.text
            controller.recipients = ["7037328391"]
            controller.messageComposeDelegate = self
          // self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
       // self.dismiss(animated: true, completion: nil)
    }
  
    
   
    
   
    
    
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
