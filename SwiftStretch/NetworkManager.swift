//
//  NetworkManager.swift
//  SwiftStretch
//
//  Created by Sobha Khadka on 2025-04-11.
//

import Foundation

protocol ExerciseListDelegate {
    func didFetchExercises ( list: [ExerciseModel])
    func networkingDidFail()
}


class NetworkingManager {
    static var shared = NetworkingManager()
    let apiKey = "3f826eca0fmsh6661100d2264c43p14c432jsn58069b6c8959"
    
    var exerciseListDelegate : ExerciseListDelegate?

    
    func getAllExercisesFromAPI(target: String){
        
        let baseURL = URL(string: "https://exercisedb.p.rapidapi.com/exercises/target/\(target)")!
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
       
        var task =  URLSession.shared.dataTask(with: request) { data, response, error in
            
            // check if there is error ===> no data
            if let error = error {
                print ("There is a network error: ",error)
                self.exerciseListDelegate?.networkingDidFail()
                return
            }
            
            // check if the response not between 200 and 299 ==> no data
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("There is no good resposne: ")
                self.exerciseListDelegate?.networkingDidFail()
                return
            }
            
        // the data is ready
            if let goodData = data {
                var decoder = JSONDecoder()
                do {
                    print(goodData)
                    var listOfExercises = try decoder.decode([ExerciseModel].self, from: goodData)
                    DispatchQueue.main.async {
                        self.exerciseListDelegate?.didFetchExercises(list: listOfExercises)
                    }
                    for exe in listOfExercises
                    {
                        print(exe.name)
                    }
                }catch {
                    print (error)
                }
//                var json = String(data: goodData, encoding: .utf8)
//                print (json ?? "no data")
            }
        
        }
        task.resume()
        
    }
}
