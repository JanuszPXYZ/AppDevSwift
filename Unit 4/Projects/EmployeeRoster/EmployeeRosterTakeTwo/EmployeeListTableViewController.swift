//
//  EmployeeListTableViewController.swift
//  EmployeeRosterGroundUp
//
//  Created by Janusz Polowczyk on 30/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class EmployeeListTableViewController: UITableViewController {
    
    var employees: [Employee] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        let employee = employees[indexPath.row]
        
        cell.textLabel?.text = employee.name
        cell.detailTextLabel?.text = employee.employeeType.description()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            employees.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let employeeDetailTableViewController = segue.destination as? EmployeeDetailTableViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "EditEmployee" {
            employeeDetailTableViewController.employee = employees[indexPath.row]
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
           guard let employeeDetailTableViewController = segue.source as? EmployeeDetailTableViewController,
               let employee = employeeDetailTableViewController.employee else {return}
           if let indexPath = tableView.indexPathForSelectedRow {
               employees.remove(at: indexPath.row)
               employees.insert(employee, at: indexPath.row)
           } else {
               employees.append(employee)
           }
       }



}
