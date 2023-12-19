//
//  ImageCarousel.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI

struct ImageCarousel: View {
    
    var photos: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(photos, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.clear
                    }
                    .frame(height: 310)
                    .padding(.horizontal, 20)
                    .containerRelativeFrame(.horizontal)
                    .scrollTransition(.animated, axis: .horizontal) { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1.0 : 0.8)
                            .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}
