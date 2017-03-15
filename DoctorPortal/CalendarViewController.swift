//
//  CalendarViewController.swift
//  DoctorPortal
//
//  Created by Masood Qureshi on 3/13/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import FSCalendar


class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {

    @IBOutlet var calendar: FSCalendar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
        
//        var currentMonth: NSDate = self.calendar.currentPage as NSDate
//      // var nextMonth: NSDate = self.gregorian.dateByAddingUnit(NSCalendarUnitMonth, value: 1, toDate: currentMonth, options: 0)
//        self.calendar.setCurrentPage(nextMonth as Date, animated: true)
        
    }
   
    
    @IBAction func PreviousMonth(_ sender: Any) {
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
