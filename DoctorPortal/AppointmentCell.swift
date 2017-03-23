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

class AppointmentCell: UITableViewCell {
    
   
  
    
    @IBOutlet var date: UILabel!

    @IBOutlet var date2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        var ref: FIRDatabaseReference!
        
        ref = FIRDatabase.database().reference()
        
        let appointment = ref.child("Appoinemnt")
        
        let newappointment = appointment.childByAutoId()
        let AppointmentDate = appointment.child("AppointmentDate")
        AppointmentDate.setValue(self.date.text)
        AppointmentDate.setValue(self.date2.text)
        let userId = FIRAuth.auth()?.currentUser?.uid
        let appointmentUserId = newappointment.child("userId");
        appointmentUserId.setValue(userId);
        
        
    }
    
    
    @IBAction func startdate(_ sender: UIButton) {
    
//    
//ActionSheetDatePicker.show(withTitle: "selectdate", datePickerMode: <#T##UIDatePickerMode#>, selectedDate:NSDate, doneBlock: <#T##ActionDateDoneBlock!##ActionDateDoneBlock!##(ActionSheetDatePicker?, Any?, Any?) -> Void#>, cancel: <#T##ActionDateCancelBlock!##ActionDateCancelBlock!##(ActionSheetDatePicker?) -> Void#>, origin: <#T##UIView!#>)
    
        }
    
   
    
    
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
