//
//  DealView.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import SwiftUI

struct DealView: View {
    
    @Environment(\.openURL) private var openURL
    
    var viewModel: DealViewModel
    
    @State private var photos: [String] = []
    @State private var backgroundColor: Color?
    @State private var foregroundColor: Color?
    @State private var accentColor: Color?
    @State private var backgroundImage: String?
    @State private var price: String?
    @State private var url: String?
    @State private var showingAlert: Bool = false
    @State private var isSoldOut: Bool = false
    
    var body: some View {
        ZStack {
            backgroundColor
            
            ScrollView {
                ZStack {
                    background
                    
                    VStack {
                        ImageCarousel(photos: photos)
                            .padding([.top], 64)
                            .frame(height: 400)
                        
                        buttons
                        
                        description
                    }
                }
            }
        }
        .task {
            await viewModel.fetchCurrentDeal()
            populateView()
        }
        .ignoresSafeArea()
        .alert(Strings.alertTitle, isPresented: $showingAlert) {
            Button(Strings.alertButtonText) {}
        } message: {
            Text(viewModel.errorString ?? Strings.defaultAlertDescription)
        }
    }
    
    var background: some View {
        AsyncImage(url: URL(string: backgroundImage ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.clear
        }
        .offset(CGSize(width: 0.0, height: -580.0))
    }
    
    @ViewBuilder
    var buttons: some View {
        if let url = url,
           let price = price {
            HStack {
                PriceButton(url: url, isSoldOut: isSoldOut, price: price)
                    .background(accentColor)
                    .foregroundColor(backgroundColor)
                    .cornerRadius(100)
                    .padding([.trailing], 16)
                
                MehButton(url: url)
                    .background(accentColor)
                    .foregroundColor(backgroundColor)
                    .clipShape(.circle)
            }
        }
    }
    
    var description: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.response?.deal.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(viewModel.response?.deal.features ?? "")
            
            Text(viewModel.response?.deal.story.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(viewModel.response?.deal.story.body ?? "")
        }
        .foregroundStyle(foregroundColor ?? .white)
        .padding(16)
    }
    
    func populateView() {
        photos = viewModel.response?.deal.photos ?? []
        backgroundColor = Color(hex: viewModel.response?.deal.theme.backgroundColor)
        backgroundImage = viewModel.response?.deal.theme.backgroundImage
        foregroundColor = viewModel.response?.deal.theme.foreground == "light" ? .white : .black
        accentColor = Color(hex: viewModel.response?.deal.theme.accentColor)
        price = String(viewModel.response?.deal.items.first?.price ?? 0)
        url = viewModel.response?.deal.url
        isSoldOut = viewModel.response?.deal.launches.first?.soldOutAt != nil
        showingAlert = viewModel.errorString != nil
    }
}

#Preview {
    DealView(viewModel: DealViewModel(networkManager: NetworkManager()))
}
