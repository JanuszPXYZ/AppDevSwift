//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Janusz Polowczyk on 16/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: [Food(name: "Sandwich with avocado", description: "Tasty sandwich with fresh avocado."), Food(name: "Scrambled eggs with orange juice", description: "Tasty scrambled eggs and a natural, fresh orange juice"), Food(name: "Hot cocoa with a bacon hamburger", description: "Our hot cocoa with a bacon hamburger. Extremely good.")])
        let lunch = Meal(name: "Lunch", food: [Food(name: "Sushi tuna rolls", description: "Exquisite sushi rolls with fresh tuna."),
        Food(name: "Vegan Steak with french fries", description: "A vegan steak made from seitan with french fries."), Food(name: "Pizza", description: "Big pizza on a thin crust, served with a homemade tomato sauce.")])
        let dinner = Meal(name: "Dinner", food: [Food(name: "Spanish Tapas with red wine", description: "Small sandwiches served with regional Spanish wine"), Food(name: "Pasta with pesto", description: "Italian pasta with pesto.")])
        
        return [breakfast, lunch, dinner]
    }

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
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let meal = meals[indexPath.section].food
        
        let food = meal[indexPath.row].name
        let description = meal[indexPath.row].description
        
        cell.textLabel?.text = food
        cell.detailTextLabel?.text = description
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
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
