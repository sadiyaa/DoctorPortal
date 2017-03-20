//
//  TableViewController.swift
//  DoctorPortal
//
//  Created by Masood Qureshi on 3/19/17.
//  Copyright © 2017 sadia masood. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct post {
    let name : String
    
    let last : String
    
    let location : String
}


class TableViewController: UITableViewController {
    
    
        
        let posts = [post]
        
        override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        post()
        
            }
    
        func post(){
            
            let name = "Name"
            let last = "Last"
            let location = "Location"
            
            let  post : [ String : AnyObject] = ["name" : name as AnyObject  ,
                                                 "last": last as AnyObject ,
                                                 "location": location as AnyObject]
            let databaseRef = FIRDatabase.database().reference()
             databaseRef.child("Posts").childByAutoId().setValue(post)
            
            tableView.reloadData()
            
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//      return posts.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        
//       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//       
//       return cell
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
