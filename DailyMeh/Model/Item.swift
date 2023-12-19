//
//  Item.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

struct Item: Codable {
    let condition: String
    let id: String
    let price: Double
    let photo: String
}
