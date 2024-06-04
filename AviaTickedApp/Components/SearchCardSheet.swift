//
//  SearchCardSheet.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCardSheet: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    @Binding var textFieldOutPressedForSheet: Bool
    
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    TextField(text: $textFieldIn) {
                        Text("Откуда - Москва")
                    }
                    .foregroundStyle(.appWhite)

                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .resizable()
                            .frame(width: 14, height: 14)
                    })
                }
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundStyle(.gray)
                    .frame(height: 1)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    TextField(text: $textFieldOut) {
                        Text("Куда - Турция")
                    }
                    .foregroundStyle(.appWhite)
                    .onTapGesture {
                        textFieldOutPressedForSheet = true
                    }
                    Button(action: {
                        textFieldOut = ""
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 14, height: 14)
                    })
                    
                }
            }
            .padding(.vertical, 8)
            .bold()
            .foregroundStyle(.gray)
            .padding()
            .background(.appGray4)
            .cornerRadius(16)
    }
}

#Preview {
    RootView()
}
