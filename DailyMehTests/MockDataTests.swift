//
//  MockDataTests.swift
//  DailyMehTests
//
//  Created by Charlie Elliott on 12/18/23.
//

import XCTest
@testable import DailyMeh

final class MockDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingMockData() throws {
        let networking = MockNetworkManager()
        Task {
            do {
                let response: Response = try await networking.fetchDailyMeh()
                XCTAssertEqual(response.deal.title, "Sharper Image SpaHaven Massaging Foot Bath", "Deal title is incorrect")
                XCTAssertEqual(response.deal.items.count, 1, "Item count is incorrect")
                XCTAssertEqual(response.deal.theme.backgroundColor, "#2f636f", "Background color is incorrect")
            } catch {
                fatalError("Unable to parse response")
            }
        }
    }

}
