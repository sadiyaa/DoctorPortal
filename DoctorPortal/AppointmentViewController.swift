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


class AppointmentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var Tableview: UITableView!
    
    
   
override func viewDidLoad() {
        super.viewDidLoad()
    
   
    
   Tableview.reloadData()
    
        

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1;
        
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
        
       
        
       let alertController = UIAlertController(title: "Appointment", message: "Your Appointment has been scheduled.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
       self.present(alertController, animated: true, completion: nil)
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
