//
//  EmployeeDetailTableViewController.swift
//  EmployeeRosterGroundUp
//
//  Created by Janusz Polowczyk on 30/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class EmployeeDetailTableViewController: UITableViewController, EmployeeTypeDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var dobDatePicker: UIDatePicker!
    
    var datePickerCellIndexPath = IndexPath(row: 2, section: 0)
    var dateLabelCellIndexPath = IndexPath(row: 1, section: 0)

    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    var employee: Employee?
    
    var employeeType: EmployeeType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()

    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case datePickerCellIndexPath:
            if isEditingBirthday {
                return dobDatePicker.frame.height
            } else {
                return 0.0
            }
        default:
            return UITableView.automaticDimension
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == dateLabelCellIndexPath {
            isEditingBirthday = !isEditingBirthday
            dobLabel.text = formatDate(date: dobDatePicker.date)
            dobLabel.textColor = .black
        }
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let employeeTypeTableViewController = segue.destination as? EmployeeTypeTableViewController
        employeeTypeTableViewController?.delegate = self
        employeeTypeTableViewController?.employeeType = employeeType
    }
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description()
        employeeTypeLabel.textColor = .black
    }
    
    @IBAction func dobDatePicker(_ sender: UIDatePicker) {
        dobLabel.text = formatDate(date: dobDatePicker.date)
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        if let name = nameTextField.text,
            let employeeType = employeeType {
            employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
            performSegue(withIdentifier: "ListUnwind", sender: self)
        }
    }
    
    @IBAction func cancelEntry(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


}
