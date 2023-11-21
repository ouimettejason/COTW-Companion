//
//  AnimalUtility.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

func findAnimal(byName name: String, in animals: [Animal]) -> Animal? {
    return animals.first(where: { $0.name == name })
}
