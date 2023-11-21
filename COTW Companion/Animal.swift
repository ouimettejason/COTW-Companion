//
//  Animal.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

struct Animal: Identifiable, Codable {
    var id = Int()
    var name: String
    var mapNames: [String]  // Maps where the animal appears
    var animalClass: Int
    var maxWeight: Double
    var maxLevel: String
    var goldRequirement: Double
    var diamondRequirement: Double
    var uncommonFurTypes: [String]?
    var rareFurTypes: [String]?
    var furTypeImages: [String]?
}
