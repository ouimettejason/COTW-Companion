//
//  mapListView.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import SwiftUI

struct mapListView: View {
    
    let maps: [Map]
    let animals: [Animal]
    
    var body: some View {
        VStack {
            VStack {
                Text("")
                Text("")
            }
            List {
                ForEach(maps) { map in
                    NavigationLink(destination: animalsOnMapView(map: map, animals: animals)) {
                        Text(map.name)
                    }
                }
            }
        }
            .navigationTitle("Maps")
    }
}
