//
//  AddRegistrationTableViewController.swift
//  guestRegistration
//
//  Created by GEU on 12/01/26.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var numberOfNights: UILabel!
    @IBOutlet weak var roomtype: UILabel!
    @IBOutlet weak var wifi: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var numberofNightsDescription: UILabel!
    @IBOutlet weak var roomtypeDescription: UILabel!
    @IBOutlet weak var wifiDescription: UILabel!
    var roomType: RoomType?
    
    var editingRegistration: Registration?
    
    let checkInDateCellIndexPath = IndexPath(row: 0, section: 1)

    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)

    let checkOutDateCellIndexPath = IndexPath(row: 2, section: 1)

    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)

    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }

    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkOutDatePicker.minimumDate = midnightToday
        checkInDatePicker.isHidden = true
        checkOutDatePicker.isHidden = true
        updateDateViews()
        updateNumberOfGuests()
        
        if let editingRegistration {
            firstNameTextField.text = editingRegistration.firstName
            lastNameTextField.text = editingRegistration.lastName
            emailTextField.text = editingRegistration.emailAddress
            checkInDatePicker.date = editingRegistration.checkInDate
            checkOutDatePicker.date = editingRegistration.checkOutDate
            numberOfAdultsStepper.value = Double(editingRegistration.numberOfAdults)
            numberOfChildrenStepper.value = Double(editingRegistration.numberOfChildren)
            wifiSwitch.isOn = editingRegistration.wifi
            roomType = editingRegistration.roomType
            updateRoomType()
            updateNumberOfGuests()
            updateDateViews()
            updateCharges()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath == checkInDatePickerCellIndexPath {
            return isCheckInDatePickerVisible ? 216 : 0
        }

        if indexPath == checkOutDatePickerCellIndexPath {
            return isCheckOutDatePickerVisible ? 216 : 0
        }

        return UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateRoomType()
        updateCharges()
    }
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        return Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text =
            "\(Int(numberOfAdultsStepper.value))"
        
        numberOfChildrenLabel.text =
            "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func updateCharges() {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.day],
            from: checkInDatePicker.date,
            to: checkOutDatePicker.date
        )
        let nights = components.day ?? 0
        numberOfNights.text = "\(nights)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let checkInString = dateFormatter.string(from: checkInDatePicker.date)
        let checkOutString = dateFormatter.string(from: checkOutDatePicker.date)
        numberofNightsDescription.text = "\(checkInString) – \(checkOutString)"
        var roomCharge = 0
        if let roomType = roomType {
            roomCharge = nights * roomType.price
            roomtype.text = "$\(roomCharge)"
            roomtypeDescription.text = "\(roomType.name) @ $\(roomType.price)/night"
        } else {
            roomtype.text = "$0"
            roomtypeDescription.text = "Not Set"
        }
        let wifiCharge = wifiSwitch.isOn ? nights * 10 : 0
        wifi.text = "$\(wifiCharge)"
        wifiDescription.text = wifiSwitch.isOn ? "Yes" : "No"
        let totalCharge = roomCharge + wifiCharge
        total.text = "$\(totalCharge)"
    }


    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
        updateCharges()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updateCharges()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateCellIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible = false
        }
        if indexPath == checkOutDateCellIndexPath {
            isCheckOutDatePickerVisible.toggle()
            isCheckInDatePickerVisible = false
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        updateCharges()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomTypeSegue" {
            let navController = segue.destination as! UINavigationController
            let selectRoomTypeVC =
            navController.topViewController
            as! SelectRoomTypeTableViewController
            selectRoomTypeVC.delegate = self
            selectRoomTypeVC.roomType = roomType
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension AddRegistrationTableViewController:
    SelectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType
    ) {
        self.roomType = roomType
        updateRoomType()
        updateCharges()
        navigationController?.popViewController(animated: true)
    }
}

