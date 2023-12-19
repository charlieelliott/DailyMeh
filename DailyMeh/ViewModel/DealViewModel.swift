//
//  DealViewModel.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

final class DealViewModel {
    
    private let networkManager: Networking
    
    var response: Response?
    var errorString: String?
    
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    
    func fetchCurrentDeal() async {
        do {
            self.response = try await networkManager.fetchDailyMeh()
        } catch {
            switch error {
            case NetworkManagerError.malformedURL:
                errorString = "Unable to reach service"
            case NetworkManagerError.httpError:
                errorString = "Unable to reach service, please try again later"
            case NetworkManagerError.jsonParsing:
                errorString = "Unable to read feed"
            default:
                errorString = "Please try again later"
            }
        }
    }
    
}
