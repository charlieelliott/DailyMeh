//
//  Poll.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

struct Poll: Codable {
    let answers: [Answer]?
    let id: String
    let startDate: String
    let title: String
    let topic: Topic
    let url: String?
}
