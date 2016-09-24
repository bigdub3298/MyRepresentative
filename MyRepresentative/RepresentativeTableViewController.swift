//
//  RepresentativeTableViewController.swift
//  MyRepresentative
//
//  Created by Wesley Austin on 9/22/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet var statePicker: UIPickerView!
    @IBOutlet var toolbar: UIToolbar!
    
    var repsArray = [Representative]()
    
    let statesArray = ["AL","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateTextField.inputView = statePicker
        stateTextField.inputAccessoryView = toolbar 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repsArray.count 
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath) as! RepresentativeTableViewCell

        let representative = repsArray[indexPath.row]
        
        cell.partyLabel.text = representative.party
        cell.nameLabel.text = representative.name
        cell.stateLabel.text = representative.state + " "
        cell.districtLabel.text = representative.district
        cell.phoneLabel.text = representative.phone
        cell.officeLabel.text = representative.office
        cell.linkLabel.text = representative.link

        return cell
    }
    
    // MARK: - Picker View Protocols 
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 49
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statesArray[row] 
    }

    
    // MARK: - Actions
    
    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        RepresentativeController.searchRepsByState(statesArray[statePicker.selectedRowInComponent(0)]) { (representative) in
            self.repsArray = representative
            
            dispatch_async(dispatch_get_main_queue(), { 
                self.tableView.reloadData()
            })
        }
        
        stateTextField.resignFirstResponder()
    }
}
