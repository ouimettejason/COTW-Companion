//
//  Map.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

struct Map: Identifiable, Codable {
    var id = Int()
    var name: String
    var animalNames: [String] // Names of animals that appear on this map
}
