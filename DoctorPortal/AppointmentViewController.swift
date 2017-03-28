//
//  AppointmentViewController.swift
//  DoctorPortal
//
//  Created by Masood Qureshi on 3/15/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import FSCalendar
import MessageUI
import Firebase
import FirebaseAuth


class AppointmentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet var Tableview: UITableView!
    
    var date = NSDate()
    
    
    
    
   
    
    var appointments = NSArray()
    
    
    
    
   
override func viewDidLoad() {
        super.viewDidLoad()
    
   
    
   Tableview.reloadData()
    
    
    
        

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        //        var item = itemcell()
        //
        //
        //         item = date[indexPath.row] as! itemcell;
        
        
        
        
        
        return cell
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
       
//        
//       let alertController = UIAlertController(title: "Appointment", message: "Your Appointment has been scheduled.", preferredStyle: .alert)
//        
//        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(defaultAction)
//        
//       self.present(alertController, animated: true, completion: nil)
//
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        return "Today's available appoinments"
        
    }
    
   
    
    @IBAction func doctor(_ sender: UIButton) {
    
    
//        
//        ActionSheetMultipleStringPicker.show(withTitle: "Multiple String Picker", rows: [
//            ["One", "Two", "A lot"],
//            ["Many", "Many more", "Infinite"]
//            ], initialSelection:[0], doneBlock: {
//                picker, values, indexes in
//            sender.setTitle(values, forState: .normal)
//                
//            
//        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)

    }
    
    @IBAction func location(_ sender: Any) {
    }
    
    
   
    @IBAction func scheduleAppointment(_ sender: UIButton) {
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            let phoneNumer = String()
            
            let userID = FIRAuth.auth()?.currentUser?.uid
            var ref: FIRDatabaseReference!
            
            ref = FIRDatabase.database().reference()

            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                let username = value?["username"] as? String ?? ""
                
                
                let date = "14/05/2017"
                controller.body = String(format: "%@ want to schedule an appointment with you on date: %@", username, date);
                controller.recipients = ["7037328391"]
                controller.messageComposeDelegate = self
                self.present(controller, animated: true, completion: nil)
                
                // ...
            }) { (error) in
                print(error.localizedDescription)
            }
            
            
           
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
        
    
        
        
    
    
    


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
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
