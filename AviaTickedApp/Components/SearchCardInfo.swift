//
//  SearchCardViewInfo.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchCardInfo: View {
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
            VStack {
                HStack {
                    TextField(text: $textFieldIn) {
                        Text("Откуда - Москва")
                    }
                    .foregroundStyle(.appWhite)
                    
                    Button(action: {
                        let texInt = textFieldIn
                        let textOut = textFieldOut
                        textFieldIn = textOut
                        textFieldOut = texInt
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
                    TextField(text: $textFieldOut) {
                        Text("Куда - Турция")
                    }
                    .foregroundStyle(.appWhite)
                    .onTapGesture {
                        textFieldOutPressedForSheet = true
                    }
                    HStack {
                        Button(action: {
                            //!!!!!!!!!!!!!!!!!!!!!!go new
                        }, label: {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 14, height: 14)
                        })
                        .opacity(textFieldOut.isEmpty ? 0 : 1)
                        Button(action: {
                            textFieldOut = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 14, height: 14)
                        })
                    }
                    
                }
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
