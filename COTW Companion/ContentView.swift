//
//  ContentView.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var trophies: [Trophy]
    
    // Initialize Maps and Animals
    var maps: [Map] = []
    var animals: [Animal] = []
    
    init() {
        // Load JSON data here for Animal
        if let animalURL = Bundle.main.url(forResource: "animalData", withExtension: "json") {
            do {
                let animalData = try Data(contentsOf: animalURL)
                // Decode an array of Animal objects
                self.animals = try JSONDecoder().decode([Animal].self, from: animalData)
                
                // Print the loaded animal data
                print("Loaded Animal Data")
            } catch {
                print("Error loading Animal JSON data: \(error)")
            }
        }
        // Load JSON data here for Map
        if let mapURL = Bundle.main.url(forResource: "mapData", withExtension: "json") {
            do {
                let mapData = try Data(contentsOf: mapURL)
                // Decode an array of Map objects
                self.maps = try JSONDecoder().decode([Map].self, from: mapData)
                
                // Print the loaded map data
                print("Loaded Map Data")
            } catch {
                print("Error loading Map JSON data: \(error)")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                }
                List {
                    NavigationLink(destination: mapListView(maps: maps, animals: animals)) {
                        Text("Maps")
                    }
                    NavigationLink(destination: TrophyListView(maps: maps, animals: animals)) {
                        Text("Trophies")
                    }
                }
                .navigationTitle("COTW Companion")
            }
        }
    }
}

#Preview { ContentView() }
