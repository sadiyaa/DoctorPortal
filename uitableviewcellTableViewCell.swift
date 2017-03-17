//
//  uitableviewcellTableViewCell.swift
//  
//
//  Created by Masood Qureshi on 3/15/17.
//
//

import UIKit

class uitableviewcellTableViewCell: UITableViewCell{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let section = ["Thu, 22 Dec", "Fri, 23 Dec", "Sat, 24 Dec"]
        
        let items = [["4:00 pm", "4:15 pm"], ["4:00 pm", "4:15 pm", "4:30 pm"], ["4:00 pm"]]
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.section.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = items[indexPath.item]
        
        return cell;
        
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
