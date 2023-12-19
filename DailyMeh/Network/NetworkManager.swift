//
//  NetworkManager.swift
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

final class NetworkManager: Networking {
    
    private func apiKey() -> String {
        Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String ?? ""
    }
    
    func fetchDailyMeh() async throws -> Response {
        return try await fetchData("https://meh.com/api/1/current.json?apikey=\(apiKey())")
    }
    
    private func fetchData<T: Decodable>(_ url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkManagerError.malformedURL
        }
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            throw NetworkManagerError.httpError
        }
        
        guard let response = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkManagerError.jsonParsing
        }
        
        return response
    }
}
