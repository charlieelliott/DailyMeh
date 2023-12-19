//
//  PriceButton.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI

struct PriceButton: View {
    
    @Environment(\.openURL) private var openURL
    
    var url: String
    var isSoldOut: Bool
    var price: String
    
    var body: some View {
        Button() {
            openURL(URL(string: url)!)
        } label: {
            if isSoldOut {
                Text(Strings.soldOutButtonText)
            } else {
                VStack {
                    Text("$\(price)")
                        .font(.headline)
                    Text(Strings.buyItButtonText)
                }
            }
        }
        .padding([.leading, .trailing], 64)
        .frame(height: 56)
        .bold()
    }
}
