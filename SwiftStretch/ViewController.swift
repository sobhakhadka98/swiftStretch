//
//  ViewController.swift
//  SwiftStretch
//
//  Created by Sobha Khadka on 2025-04-04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var targetList: UITableView!
    
    let targets = [
        "abductors",
        "abs",
        "adductors",
        "biceps",
        "calves",
        "cardiovascular system",
        "delts",
        "forearms",
        "glutes",
        "hamstrings",
        "lats",
        "levator scapulae",
        "pectorals",
        "quads",
        "serratus anterior",
        "spine",
        "traps",
        "triceps",
        "upper back"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetList.dataSource = self
        targetList.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return targets.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "target")!
        cell.textLabel?.text = "\(targets[indexPath.row])"
        cell.imageView?.image = UIImage(named: "\(targets[indexPath.row])")
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exerciseList"{
            let EVC = segue.destination as! ExerciseListTableViewController
            EVC.targetName = targets[(targetList.indexPathForSelectedRow?.row)!]
            targetList.deselectRow(at: targetList.indexPathForSelectedRow!, animated: true)
        }
        
    }

}

 
