//
//  SearchAllTickedInfo.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchAllTickedInfo: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    @Binding var textFieldOutPressedForSheet: Bool
    
    @StateObject private var vm = AllTicketsViewModel()

    var body: some View {
        VStack {
            SearchCardAllTicketInfo(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut, textFieldOutPressedForSheet: $textFieldOutPressedForSheet)
            
            ScrollView(.vertical) {
                ForEach(vm.allTickets) { ticket in
                    SearchCardAllTicketRow(
                        badge: ticket.badge,
                        price: ticket.price,
                        departure: ticket.departure,
                        arrival: ticket.arrival,
                        hasTransfer: ticket.hasTransfer
                    )
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, 16)

    }
}

#Preview {
    RootView()
}
