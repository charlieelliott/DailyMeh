//
//  TestColorConversion.swift
//  DailyMehTests
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI
import XCTest
@testable import DailyMeh

final class TestColorConversion: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexColor() throws {
        let color1 = UIColor(Color(hex: "#2f636f"))
        var red1: CGFloat = 0, green1: CGFloat = 0, blue1: CGFloat = 0, alpha1: CGFloat = 0
        color1.getRed(&red1, green:&green1, blue:&blue1, alpha:&alpha1)
        
        let color2 = UIColor(red: 0.18431371450424194, green: 0.38823527097702026, blue: 0.43529409170150757, alpha: 1)
        var red2:CGFloat=0, green2:CGFloat=0, blue2:CGFloat=0, alpha2:CGFloat=0
        color2.getRed(&red2, green:&green2, blue:&blue2, alpha:&alpha2)
        
        XCTAssertEqual(red1, red2)
        XCTAssertEqual(green1, green2)
        XCTAssertEqual(blue1, blue2)
        XCTAssertEqual(alpha1, alpha2)
    }

}
