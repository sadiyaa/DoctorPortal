//
//  AppointmentCell.swift
//  DoctorPortal
//
//  Created by Masood Qureshi on 3/16/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import MessageUI

class AppointmentCell: UITableViewCell,MFMessageComposeViewControllerDelegate {
    
   
    
    @IBOutlet var phoneNumber: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func sendText(_ sender: UIButton) {
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = [phoneNumber.text!]
            controller.messageComposeDelegate = self
           
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        //self.dismiss(animated: true, completion: nil)
    }
    
    
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
