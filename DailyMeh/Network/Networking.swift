//
//  Networking.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

protocol Networking {
    func fetchDailyMeh() async throws -> Response
}

enum NetworkManagerError: Error {
    case malformedURL
    case httpError
    case jsonParsing
}
