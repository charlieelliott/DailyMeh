//
//  Response.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

struct Response: Codable {
    let deal: Deal
    let poll: Poll
    let video: Poll
}
