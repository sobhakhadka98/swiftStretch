//
//  FavTableViewController.swift
//  SwiftStretch
//
//  Created by Umesh Basnet on 17/04/2025.
//

import UIKit

class FavTableViewController: UITableViewController, FavExerciseListDelegate {
    
    
    
    var dbList = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManager.shared.delegate = self
        dbList = CoreDataManager.shared.getAllExercisesFromDB()
        print(dbList.count)

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
        return dbList.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dbList = CoreDataManager.shared.getAllExercisesFromDB()
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dbList[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favexercisedetail" {
            let EDVC = segue.destination as! ExerciseDetailViewController
            let exercise = dbList[(tableView.indexPathForSelectedRow?.row)!]
            print(exercise.instructions!)
            let newExercise: ExerciseModel = ExerciseModel()
            newExercise.id = exercise.id!
            newExercise.name = exercise.name!
            newExercise.bodyPart = exercise.bodyPart!
            newExercise.equipment = exercise.equipment!
            newExercise.gifUrl = exercise.gifUrl!
            newExercise.instructions = exercise.instructions!
            newExercise.secondaryMuscles = exercise.secondaryMuscles!
            newExercise.target = exercise.target!
            EDVC.exerciseDetail = newExercise
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func didFetchExercises(list: [Exercise]) {
        dbList = CoreDataManager.shared.getAllExercisesFromDB()
        self.tableView.reloadData()
    }
    
    func fetchingDidFail() {
        dbList = []
        self.tableView.reloadData()
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
