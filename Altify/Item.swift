//
//  Item.swift
//  Altify
//
//  Created by Dave Williams on 26/03/2025.
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
