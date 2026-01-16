//
//  RegistrationTableViewController.swift
//  guestRegistration
//
//  Created by GEU on 13/01/26.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = [
        Registration(
            firstName: "John",
            lastName: "Doe",
            emailAddress: "john.doe@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 1, day: 20))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 1, day: 22))!,
            numberOfAdults: 2,
            numberOfChildren: 0,
            wifi: true,
            roomType: RoomType.all[0]
        ),
        Registration(
            firstName: "Emma",
            lastName: "Wilson",
            emailAddress: "emma.wilson@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 2, day: 3))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 2, day: 6))!,
            numberOfAdults: 1,
            numberOfChildren: 1,
            wifi: false,
            roomType: RoomType.all[1]
        ),
        Registration(
            firstName: "Michael",
            lastName: "Brown",
            emailAddress: "michael.brown@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 10))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 15))!,
            numberOfAdults: 2,
            numberOfChildren: 2,
            wifi: true,
            roomType: RoomType.all[2]
        ),
        Registration(
            firstName: "Sophia",
            lastName: "Taylor",
            emailAddress: "sophia.taylor@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 4, day: 5))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 4, day: 8))!,
            numberOfAdults: 1,
            numberOfChildren: 0,
            wifi: true,
            roomType: RoomType.all[0]
        ),
        Registration(
            firstName: "Daniel",
            lastName: "Anderson",
            emailAddress: "daniel.anderson@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 5, day: 12))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 5, day: 14))!,
            numberOfAdults: 2,
            numberOfChildren: 1,
            wifi: false,
            roomType: RoomType.all[1]
        ),
        Registration(
            firstName: "Olivia",
            lastName: "Martinez",
            emailAddress: "olivia.martinez@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 6, day: 1))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 6, day: 4))!,
            numberOfAdults: 1,
            numberOfChildren: 0,
            wifi: true,
            roomType: RoomType.all[2]
        ),
        Registration(
            firstName: "James",
            lastName: "Lee",
            emailAddress: "james.lee@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 7, day: 18))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 7, day: 21))!,
            numberOfAdults: 2,
            numberOfChildren: 2,
            wifi: true,
            roomType: RoomType.all[0]
        ),
        Registration(
            firstName: "Ava",
            lastName: "Clark",
            emailAddress: "ava.clark@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 8, day: 9))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 8, day: 12))!,
            numberOfAdults: 1,
            numberOfChildren: 1,
            wifi: false,
            roomType: RoomType.all[1]
        ),
        Registration(
            firstName: "William",
            lastName: "Harris",
            emailAddress: "william.harris@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 9, day: 2))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 9, day: 5))!,
            numberOfAdults: 2,
            numberOfChildren: 0,
            wifi: true,
            roomType: RoomType.all[2]
        ),
        Registration(
            firstName: "Isabella",
            lastName: "Young",
            emailAddress: "isabella.young@example.com",
            checkInDate: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 14))!,
            checkOutDate: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 18))!,
            numberOfAdults: 2,
            numberOfChildren: 1,
            wifi: true,
            roomType: RoomType.all[0]
        )
    ]

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
        return registrations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        // Configure the cell...
        let registration = registrations[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(registration.firstName) \(registration.lastName)"
        content.secondaryText =
        "\(registration.checkInDate.formatted(date: .numeric, time: .omitted)) - " +
        "\(registration.checkOutDate.formatted(date: .numeric, time: .omitted)), " +
        registration.roomType.name
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditRegistrationSegue" {
            guard let navController = segue.destination as? UINavigationController, let addVC = navController.topViewController as? AddRegistrationTableViewController, let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            addVC.editingRegistration = registrations[indexPath.row]
        }
    }
    
    @IBAction func unwindFromAddRegistration(_ segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? AddRegistrationTableViewController, let registration = sourceVC.registration else {
            return
        }
        if let indexPath = tableView.indexPathForSelectedRow {
            registrations[indexPath.row] = registration
        } else {
            registrations.append(registration)
        }
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
