//
//  EmployeeTypeTableViewController.swift
//  EmployeeRosterGroundUp
//
//  Created by Janusz Polowczyk on 31/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

protocol EmployeeTypeDelegate {
    func didSelect(employeeType: EmployeeType)
}


class EmployeeTypeTableViewController: UITableViewController {
    
    var employeeType: EmployeeType?
    var delegate: EmployeeTypeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EmployeeType.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        let type = EmployeeType.all[indexPath.row]
        
        cell.textLabel?.text = type.description()
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenType = EmployeeType.all[indexPath.row]
        employeeType = chosenType
        delegate?.didSelect(employeeType: chosenType)
        tableView.reloadData()
    }


}
