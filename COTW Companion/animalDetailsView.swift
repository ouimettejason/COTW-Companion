//
//  animalDetailsView.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

struct animalDetailsView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30) { // Increase spacing to add more space between elements
                
                HStack {
                    Text("Class:")
                        .fontWeight(.bold)
                    Text("\(animal.animalClass)")
                }
                
                HStack {
                    Text("Max Level:")
                        .fontWeight(.bold)
                    Text(animal.maxLevel)
                }
                
                HStack {
                    Text("Max Weight:")
                        .fontWeight(.bold)
                    if animal.maxWeight.truncatingRemainder(dividingBy: 1) == 0 {
                        Text("\(Int(animal.maxWeight)) lbs")
                    } else {
                        Text(String(format: "%.1f lbs", animal.maxWeight))
                    }
                }
                
                HStack {
                    Text("Gold Requirement:")
                        .fontWeight(.bold)
                    if animal.goldRequirement.truncatingRemainder(dividingBy: 1) == 0 {
                        Text("\(Int(animal.goldRequirement))")
                    } else {
                        Text(String(format: "%.2f", animal.goldRequirement))
                    }
                }
                
                HStack {
                    Text("Diamond Requirement:")
                        .fontWeight(.bold)
                    if animal.diamondRequirement.truncatingRemainder(dividingBy: 1) == 0 {
                        Text("\(Int(animal.diamondRequirement))")
                    } else {
                        Text(String(format: "%.2f", animal.diamondRequirement))
                    }
                }
                
                // Uncommon Fur Types
                VStack(alignment: .center, spacing: 5) {
                    Text("Uncommon Fur Types:")
                        .fontWeight(.bold)
                    if let uncommonFurTypes = animal.uncommonFurTypes {
                        ForEach(uncommonFurTypes, id: \.self) { furType in
                            Text(furType)
                        }
                    } else {
                        Text("No Uncommon Fur Types")
                    }
                }
                
                // Rare Fur Types
                VStack(alignment: .center, spacing: 5) {
                    Text("Rare Fur Types:")
                        .fontWeight(.bold)
                    if let rareFurTypes = animal.rareFurTypes {
                        ForEach(rareFurTypes, id: \.self) { furType in
                            Text(furType)
                        }
                    } else {
                        Text("No Rare Fur Types")
                    }
                }
                
                Spacer() // Add Spacer to center content vertically
            }
            .padding(20)
        }
        .navigationTitle(animal.name)
    }
}
