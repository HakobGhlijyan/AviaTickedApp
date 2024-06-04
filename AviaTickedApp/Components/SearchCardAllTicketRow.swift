//
//  SearchCardAllTicketRow.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCardAllTicketRow: View {
    
    var badge: String?
    var price: Price
    var departure: Arrival
    var arrival: Arrival
    var hasTransfer: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text("\(price.value) P")
                    .font(.title)
                    .bold()
                
                HStack() {
                    Circle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            HStack(alignment: .top) {
                                Text("\(departure.date.dropFirst(11).dropLast(3)) - \(arrival.date.dropFirst(11).dropLast(3))")
                                Text("3.5 в пути \(hasTransfer ? "/Без пересадок" : "")")
                            }
                            .font(.subheadline)
                            .bold()
                        }
                        HStack(alignment: .top, spacing: 10.0) {
                            Text("\(departure.airport)".uppercased())
                            Text("\(arrival.airport)".uppercased())
                        }
                        .font(.callout)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.appGray2)
            .cornerRadius(16)
            
            Text(badge ?? "Прилет вечером")
                .font(.subheadline)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(.appBlue)
                .cornerRadius(20)
                .offset(y: -14)
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    RootView()
}
