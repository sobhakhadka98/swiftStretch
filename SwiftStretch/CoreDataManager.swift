//
//  CoreDataManager.swift
//  SwiftStretch
//
//  Created by Umesh Basnet on 17/04/2025.
//

import Foundation
import UIKit
import CoreData

protocol FavExerciseListDelegate {
    func didFetchExercises ( list: [Exercise])
    func fetchingDidFail()
}

class CoreDataManager {
    static var shared : CoreDataManager = CoreDataManager()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate : FavExerciseListDelegate?
    
    func addNewExerciseToDB(exercise: ExerciseModel) {
        var dbResult = filterExercisesInDB(query: exercise.id)
        if(dbResult.count == 0){
            let newExercise:  Exercise = Exercise(context: context)
            newExercise.id = exercise.id
            newExercise.name = exercise.name
            newExercise.bodyPart = exercise.bodyPart
            newExercise.equipment = exercise.equipment
            newExercise.gifUrl = exercise.gifUrl
            newExercise.instructions = exercise.instructions
            newExercise.secondaryMuscles = exercise.secondaryMuscles
            newExercise.target = exercise.target
            saveContext()
            delegate?.didFetchExercises(list: [])
        }
    }
    
    func deleteOneExerciseFromDB(exerciseToDelete: Exercise){
        context.delete(exerciseToDelete)
        saveContext()
        delegate?.didFetchExercises(list: [])
    }
    func deleteOneExerciseFromDB(idToDelete: String){
        let dbResult = filterExercisesInDB(query: idToDelete)
        if (dbResult.count == 1){
            deleteOneExerciseFromDB(exerciseToDelete: dbResult.first!)
            saveContext()
        }
    }
    
    func getAllExercisesFromDB() -> [Exercise]{
        var dbList = [Exercise]()
        let fetchRequest = Exercise.fetchRequest()
        do {
            dbList = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return dbList
    }
    
    func filterExercisesInDB (query : String) -> [Exercise]{
           
           // select * from City order by cityName where cityName beigens 't'
        var dblist = [Exercise]()
        var fetchRequest =  Exercise.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: true)]
            
          var predicate =  NSPredicate(format: "id like [i] %@" ,query)
            fetchRequest.predicate = predicate
            
            do {
                dblist = try  context.fetch(fetchRequest)
                // update ui
                
            }catch {
                print("error")
            }
            return dblist
        }
        
        // delete one city
        // fetch all cities
        // filter cities
        
        

        
        func saveContext () {
            let context = context
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}
