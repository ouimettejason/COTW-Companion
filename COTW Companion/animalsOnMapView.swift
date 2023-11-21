//
//  animalsOnMapView.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

struct animalsOnMapView: View {
    
    let map: Map
    let animals: [Animal]
    
    var body: some View {
        // Display a list of animals that appear on the selected map
        VStack {
            VStack {
                Text("")
                Text("")
            }
            List {
                ForEach(map.animalNames, id: \.self) { animalName in
                    if let animal = findAnimal(byName: animalName, in: animals) {
                        NavigationLink(
                            destination: animalDetailsView(animal: animal),
                            label: {
                                Text(animalName)
                            }
                        )
                    } else {
                        // Handle the case when the animal is not found
                        Text("Animal not found: \(animalName)")
                    }
                }
                .navigationTitle(map.name)
            }
        }
    }
}
