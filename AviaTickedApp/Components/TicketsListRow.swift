//
//  TicketsListRow.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct TicketsListRow: View {
    let title: String
    let timeRange: [String]
    let price: Price
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.red)
                
                    HStack {
                        Text(title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(price.value) P")
                    
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(timeRange, id: \.hashValue) { time in
                        Text("\(time)")
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: 2)
                .frame(height: 2)
                .foregroundStyle(.appGray5)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    RootView()
}
