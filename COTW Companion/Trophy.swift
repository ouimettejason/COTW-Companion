//
//  Trophy.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import Foundation
import SwiftData

@Model
class Trophy {
    var mapName: String
    var animalName: String
    var furType: String
    var trophyScore: Float
    var medal: String
    
    init(mapName: String, animalName: String, furType: String, trophyScore: Float, medal: String) {
        self.mapName = mapName
        self.animalName = animalName
        self.furType = furType
        self.trophyScore = trophyScore
        self.medal = medal
    }
}
