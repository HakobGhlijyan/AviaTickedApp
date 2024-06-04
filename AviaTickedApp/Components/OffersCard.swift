//
//  OffersCard.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

// MARK: - Offer View
struct OffersCard: View {
    var title: String
    var town: String
    var price: Int
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .frame(width: 140,height: 140)
                .cornerRadius(16)
            
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(town)
                    .font(.subheadline)
                
                HStack {
                    Image(systemName: "airplane")
                    Text("от \(price) ₽ ")
                }
            }
        }
        .background(.black.opacity(0.001))
    }
}


#Preview {
    RootView()
}
