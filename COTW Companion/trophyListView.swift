//
//  trophyListView.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftData
import SwiftUI

struct TrophyListView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query(sort: \Trophy.animalName) var trophies: [Trophy]
    @State private var trophyToEdit: Trophy?
    
    let maps: [Map]
    let animals: [Animal]

    var body: some View {
        List {
            ForEach(trophies) { trophy in
                TrophyCell(trophy: trophy)
                    .onTapGesture {
                        trophyToEdit = trophy
                    }
            }
            .onDelete { IndexSet in
                for index in IndexSet {
                    context.delete(trophies[index])
                }
            }
        }
        .navigationTitle("Trophies")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $isShowingItemSheet, content: { AddTrophySheet(maps: maps, animals: animals) })
        .sheet(item: $trophyToEdit) { trophy in
            UpdateTrophySheet(trophy: trophy)
        }
        .toolbar {
            if !trophies.isEmpty {
                Button("Add Trophy", systemImage: "plus") {
                    isShowingItemSheet = true
                }
            }
        }
        .overlay {
            if trophies.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Trophies", systemImage: "list.bullet.rectangle.portrait")
                }, description: {
                    Text("Start adding trophies!")
                }, actions: {
                    Button("Add Trophy") {isShowingItemSheet = true}
                })
                .offset(y: -60)
            }
        }
    }
}

struct TrophyCell: View {
    
    let trophy: Trophy
    
    var body: some View {
        VStack {
            Text(trophy.animalName)
                .bold()
                .padding()
            HStack {
                Text("Map:")
                Spacer()
                Text(trophy.mapName)
            }
            HStack {
                Text("Fur Type:")
                Spacer()
                Text(trophy.furType)
            }
            HStack {
                Text("Trophy Rating:")
                Spacer()
                Text(trophy.trophyScore, format: .number)
            }
        }
    }
}

struct AddTrophySheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var selectedMapIndex = 0
    @State private var selectedAnimalIndex = 0
    @State private var selectedFurTypeIndex = 0
    @State private var trophyScore: Float = 0
    @State private var selectedAnimal: Animal?
    
    
    // Assuming you have a list of maps and animals available
    let maps: [Map]  // Populate with actual data
    let animals: [Animal]  // Populate with actual data
    let allFurTypes: [String] = ["Common", "Albino", "Bald Leucistic", "Beige", "Black", "Blackgold", "Blonde", "Blonde Piebald", "Blue", "Brown", "Chocolate", "Cinnamon", "Cream", "Crowned", "Dark", "Dark Brown", "Dilute", "Dusky", "Dusky Gradient", "Eclipse", "Eggwhite", "Gold", "Grey", "Grey Piebald", "Honeytones", "Hybrid", "Hybrid Blue", "Hybrid Green", "Leucistic", "Light Brown", "Light Gray Leucistic", "Light Grey", "Melanistic", "Mixed", "Mocha", "Molting", "Mottled", "Ochre", "Olive", "Orange", "Pale", "Piebald", "Pristine", "Red", "Red Brown", "Spirit", "Two Tones", "White", "Winter"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Map", selection: $selectedMapIndex) {
                    ForEach(0..<maps.count, id: \.self) { index in
                        Text(maps[index].name).tag(index)
                    }
                }
                
                Picker("Animal", selection: $selectedAnimalIndex) {
                    ForEach(0..<animals.count, id: \.self) { index in
                        Text(animals[index].name).tag(index)
                    }
                }
                
                Picker("Fur Type", selection: $selectedFurTypeIndex) {
                    ForEach(0..<allFurTypes.count, id: \.self) { index in
                        Text(allFurTypes[index])
                            .tag(index)
                    }
                }
                
                TextField("Trophy Rating", value: $trophyScore, format: .number)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Trophy")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // Save code here!
                        let selectedMap = maps[selectedMapIndex]
                        let selectedAnimal = animals[selectedAnimalIndex]
                        let selectedFurType = allFurTypes[selectedFurTypeIndex]
                        
                        let trophy = Trophy(
                            mapName: selectedMap.name,
                            animalName: selectedAnimal.name,
                            furType: selectedFurType,
                            trophyScore: trophyScore)
                        
                        context.insert(trophy)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateTrophySheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var trophy: Trophy // passes in the expense value and allows it to be updated
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Map", text: $trophy.mapName)
                TextField("Animal", text: $trophy.animalName)
                TextField("Fur Type", text: $trophy.furType)
                TextField("Trophy Rating", value: $trophy.trophyScore, format: .number)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Trophy")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

