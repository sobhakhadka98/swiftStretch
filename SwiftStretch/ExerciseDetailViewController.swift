//
//  ExerciseDetailViewController.swift
//  SwiftStretch
//
//  Created by Sobha Khadka on 2025-04-11.
//

import UIKit
import SDWebImage

class ExerciseDetailViewController: UIViewController {
    
    var exerciseDetail : ExerciseModel = ExerciseModel()
    
    @IBOutlet weak var exerciseName: UILabel!
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    @IBOutlet weak var bodyPart: UILabel!
    
    @IBOutlet weak var target: UILabel!
    
    @IBOutlet weak var equipment: UILabel!
    
    @IBOutlet weak var secondaryMuscles: UILabel!
    
    @IBOutlet weak var instrctionsList: UITextView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var favIcon: UIBarButtonItem!
    
    var notFav = UIImage(systemName: "heart")
    var fav = UIImage(systemName: "heart.fill")
    override func viewDidLoad() {
        super.viewDidLoad()
        initExerciseDetail()
        setFavIcon()
       
        
        // Do any additional setup after loading the view.
    }
    
    func setFavIcon(){
        if(CoreDataManager.shared.filterExercisesInDB(query: exerciseDetail.id).count > 0){
            favIcon.setBackgroundImage(fav, for: .normal, barMetrics: .default)
        } else {
            favIcon.setBackgroundImage(notFav, for: .normal, barMetrics: .default)
        }
    }
    
    func initExerciseDetail(){
        exerciseName.text = exerciseDetail.name
        if let gifUrl = URL(string: exerciseDetail.gifUrl){
            exerciseImage.sd_setImage(with: gifUrl)
        }
        bodyPart.text = exerciseDetail.bodyPart
        target.text = exerciseDetail.target
        equipment.text = exerciseDetail.equipment
        secondaryMuscles.text = ""
        for s in exerciseDetail.secondaryMuscles {
            secondaryMuscles.text! += s + ","
        }
        instrctionsList.text = ""
        var k = 1
        for i in exerciseDetail.instructions {
            instrctionsList.text! = "\(instrctionsList.text!)\n\(k). \(i)"
            k += 1
        }
    }
    
    @IBAction func addingToFav(_ sender: Any) {
        let isFavorite = CoreDataManager.shared.filterExercisesInDB(query: exerciseDetail.id).count > 0
        var alertMessage: String = ""
        if(!isFavorite){
            alertMessage = "Do you want to save this exercise to your favorite exercise"
        } else {
            alertMessage = "Do you want to remove this exercise from favourite exercises"
        }
        var alert = UIAlertController(title: "", message: alertMessage, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                    // save to db
                    if (isFavorite) {
                        CoreDataManager.shared.deleteOneExerciseFromDB(idToDelete: self.exerciseDetail.id)
                        self.setFavIcon()
                    } else {
                        CoreDataManager.shared.addNewExerciseToDB(exercise: self.exerciseDetail)
                        self.setFavIcon()
                    }

                }))
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in

                    
                }))
                
                present(alert, animated: true)
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
