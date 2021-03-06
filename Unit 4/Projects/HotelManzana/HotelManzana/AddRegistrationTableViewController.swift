//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Janusz Polowczyk on 25/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    var roomType: RoomType?
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(noOfAdultsStepper.value)
        let numberOfChildren = Int(noOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn

        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkIn: checkInDate, checkOut: checkOutDate, noOfAdults: numberOfAdults, noOfChildren: numberOfChildren, roomChoice: roomType, wifiAccess: hasWifi)
    }
    
    
    @IBOutlet var doneBarButtonItem: UIBarButtonItem!
    
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    
    
    @IBOutlet var noOfAdultsLabel: UILabel!
    @IBOutlet var noOfAdultsStepper: UIStepper!
    @IBOutlet var noOfChildrenLabel: UILabel!
    @IBOutlet var noOfChildrenStepper: UIStepper!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }

    
    func updateDateViews() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
        
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInDateLabelCellIndexPath:
            
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case checkOutDateLabelCellIndexPath:
            if isCheckOutDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
        
    }
    
    func updateNumberOfGuests() {
        noOfAdultsLabel.text = "\(Int(noOfAdultsStepper.value))"
        noOfChildrenLabel.text = "\(Int(noOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
        formFilled()
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func formFilled() {
        if self.registration != nil {
            doneBarButtonItem.isEnabled = true
        } else {
            doneBarButtonItem.isEnabled = false
        }
    }
    
    
}
