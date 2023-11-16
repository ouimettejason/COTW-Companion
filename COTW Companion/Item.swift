//
//  Item.swift
//  COTW Companion
//
//  Created by Jason Ouimette on 11/15/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
