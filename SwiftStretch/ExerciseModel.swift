//
//  ExerciseModel.swift
//  SwiftStretch
//
//  Created by Sobha Khadka on 2025-04-04.
//

import Foundation

class ExerciseModel: Codable {
    var id: String = ""
    var name: String = ""
    var bodyPart: String = ""
    var target: String = ""
    var equipment: String = ""
    var gifUrl: String = ""
    var secondaryMuscles: [String] = []
    var instructions: [String] = []
}
