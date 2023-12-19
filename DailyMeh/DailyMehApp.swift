//
//  DailyMehApp.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI

@main
struct DailyMehApp: App {
    var body: some Scene {
        WindowGroup {
            DealView(viewModel: DealViewModel(networkManager: NetworkManager()))
        }
    }
}
