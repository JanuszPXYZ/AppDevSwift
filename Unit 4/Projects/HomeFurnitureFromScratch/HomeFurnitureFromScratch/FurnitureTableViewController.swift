//
//  FurnitureTableViewController.swift
//  HomeFurnitureFromScratch
//
//  Created by Janusz Polowczyk on 22/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class FurnitureTableViewController: UITableViewController {
    
    var rooms: [Room] = [
        Room(name: "Living Room", furniture: [
            Furniture(name: "Couch", description: "A comfy place to sit down."),
            Furniture(name: "Television", description: "Entertainment for all to watch."),
            Furniture(name: "Coffee Table", description: "A great place to set down your drink.")]),
        Room(name: "Kitchen", furniture: [
            Furniture(name: "Stove", description: "Warm and cook your food here."),
            Furniture(name: "Oven", description: "Bake a delicious treat for your friends."),
            Furniture(name: "Sink", description: "Don't forget to clean the dishes!")]),
        Room(name: "Bedroom", furniture: [
            Furniture(name: "Bed", description: "A place to sleep during the night."),
            Furniture(name: "Desk", description: "Study to keep your mind sharp"),
            Furniture(name: "Closet", description: "Hang your clothes to keep them unwrinkled")])
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
        return rooms.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfFurnitureItems = rooms[section].furniture.count
        return numberOfFurnitureItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath)
        let furniture = rooms[indexPath.section].furniture
        
        cell.textLabel?.text = furniture[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return rooms[section].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == "DetailViewSegue" {
            let selectedRoom = rooms[selectedIndexPath.section]
            let selectedFurniture = selectedRoom.furniture[selectedIndexPath.row]
            let furnitureDetailViewController = segue.destination as? DetailViewController
            furnitureDetailViewController?.furniture = selectedFurniture
        }
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
