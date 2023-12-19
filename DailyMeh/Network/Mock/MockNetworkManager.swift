//
//  MockNetworkManager.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation

final class MockNetworkManager: Networking {
    
    func fetchDailyMeh() async throws -> Response {
        return try await fetchData("MockResponse", type: "json")
    }
    
    private func fetchData<T: Decodable>(_ fileName: String, type: String) async throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: type) else {
            throw NetworkManagerError.malformedURL
        }
        
        guard let data = try? Data(contentsOf: url) else {
            throw NetworkManagerError.httpError
        }
        
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            print("\(error.localizedDescription)")
            throw NetworkManagerError.jsonParsing
        }
    }
}
