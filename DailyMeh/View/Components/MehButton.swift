//
//  MehButton.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI

struct MehButton: View {
    
    @Environment(\.openURL) private var openURL
    
    var url: String
    
    var body: some View {
        Button() {
            openURL(URL(string: url)!)
        } label: {
            Text(Strings.mehButtonText)
                .font(.headline)
        }
        .frame(width: 56, height: 56)
    }
}
