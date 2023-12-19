//
//  Deal.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

struct Deal: Codable {
    let features: String
    let id: String
    let items: [Item]
    let photos: [String]
    let purchaseQuantity: PurchaseQuantity
    let title: String
    let specifications: String
    let story: Story
    let theme: Theme
    let url: String
    let launches: [Launch]
    let topic: Topic
}
