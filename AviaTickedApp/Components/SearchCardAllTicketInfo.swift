//
//  SearchCardAllTicketInfo.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCardAllTicketInfo: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    @Binding var textFieldOutPressedForSheet: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack(spacing: 16.0) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 16, height: 16)
            })
            
            VStack(alignment: .leading) {
                Text("\(textFieldIn) - \(textFieldOut)")
                    .foregroundStyle(.appWhite)
                Text("24 февраля, суббота , 1 эконом")
            }
        }
        
        .padding(.vertical, 14)
        .bold()
        .foregroundStyle(.gray)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .background(.appGray4)
        .cornerRadius(16)
    }
}

#Preview {
    RootView()
}
