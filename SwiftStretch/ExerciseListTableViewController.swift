//
//  ExerciseListTableViewController.swift
//  SwiftStretch
//
//  Created by Sobha Khadka on 2025-04-04.
//

import UIKit

class ExerciseListTableViewController: UITableViewController, ExerciseListDelegate {
        
    var targetName: String = ""
    var exercises : [ExerciseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.exerciseListDelegate = self
        NetworkingManager.shared.getAllExercisesFromAPI(target: targetName)
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
        return exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row].name
        return cell
    }
    
    func didFetchExercises(list: [ExerciseModel]) {
        exercises = list
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func networkingDidFail() {
        exercises = []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func targetExercises(targetName: String) {
        //let url =URL(string: <#T##String#>)
//        let urlString = "https://exercisedb.p.rapidapi.com/exercises/target/\(targetName)";
//        guard let url = URL(string: urlString) else {
//                    delegate?.exerciseListDidFail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
//                    return
//                }
//                
//                var request = URLRequest(url: url)
//                request.httpMethod = "GET"
//                request.addValue(Constants.apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
//                request.addValue("exercisedb.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//                
//                URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//                    if let error = error {
//                        self.delegate?.exerciseListDidFail(error: error)
//                        return
//                    }
//                    
//                    guard let data = data else {
//                        self?.delegate?.exerciseListDidFail(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
//                        return
//                    }
//                    
//                    do {
//                        let exercises = try JSONDecoder().decode([ExerciseModel].self, from: data)
//                        self?.delegate?.exerciseListDidFinishWithResult(exercises: exercises)
//                    } catch {
//                        self?.delegate?.exerciseListDidFail(error: error)
//                    }
//                }
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exercisedetail"{
            var EDVC = segue.destination as! ExerciseDetailViewController
            EDVC.exerciseDetail = exercises[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }

}
