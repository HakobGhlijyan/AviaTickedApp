//
//  SearchCard.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCard: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 16, height: 16)
            })
            
            VStack {
                TextField(text: $textFieldIn) {
                    Text("Откуда - Москва")
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                
                TextField(text: $textFieldOut) {
                    Text("Куда - Турция")
                }
            }
            .foregroundStyle(.appWhite)
            .padding(.vertical, 8)
        }
        .bold()
        .foregroundStyle(.gray)
        .padding()
        .background(.appGray4)
        .cornerRadius(16)
        .padding()
        .background(.appGray3)
        .cornerRadius(16)
    }
}
#Preview {
    RootView()
}
