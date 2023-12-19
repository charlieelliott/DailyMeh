//
//  Topic.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

struct Topic: Codable {
    let commentCount: Int
    let createdAt: String
    let id: String
    let replyCount: Int
    let url: String
    let voteCount: Int
}
