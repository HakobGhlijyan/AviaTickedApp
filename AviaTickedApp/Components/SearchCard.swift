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
    @Binding var textFieldOutPressedForSheet: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 16, height: 16)
            })
            
            VStack {
                HStack {
                    TextField(text: $textFieldIn) {
                        Text("Откуда - Москва")
                    }
                    .foregroundStyle(.appWhite)
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                
                HStack {
                    TextField(text: $textFieldOut) {
                        Text("Куда - Турция")
                    }
                    .foregroundStyle(.appWhite)
                    .disabled(textFieldIn.isEmpty ? true : false)
                    .onTapGesture {
                        textFieldOutPressedForSheet = true
                    }

                }
            }
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
