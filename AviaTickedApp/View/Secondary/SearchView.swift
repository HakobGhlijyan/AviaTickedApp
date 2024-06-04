//
//  SearchCardView.swift
//  AviaTickedApp
//
//  Created by Hakob Ghlijyan on 04.06.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var textFieldIn: String
    @Binding var textFieldOut: String
    @Binding var textFieldOutPressedForSheet: Bool
    @State private var elementsPressed: Bool = false
    @State private var searchCardViewInfo: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.appGray2)
                    .frame(width: 50, height: 6)
                    .padding(.vertical, 16)
                    
                SearchCardSheet(textFieldIn: $textFieldIn, textFieldOut: $textFieldOut, textFieldOutPressedForSheet: $textFieldOutPressedForSheet, action: {
                    searchCardViewInfo.toggle()
                })
                    .padding(.horizontal, 16)
                
                ElementSection
                
                LocationView()
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .sheet(isPresented: $elementsPressed, content: {
                Text("Hello")
            })
            .fullScreenCover(isPresented: $searchCardViewInfo,
                             content: {
                SearchCardViewInfo(
                    textFieldIn: $textFieldIn,
                    textFieldOut: $textFieldOut,
                    textFieldOutPressedForSheet: $textFieldOutPressedForSheet
                )
            })
            .scrollIndicators(.hidden)
        }
        
    }
}

extension SearchView {
    private var ElementSection: some View {
        HStack(alignment: .top, spacing: 30.0) {
            ModalViewEx(imageColor: .appWhite, recColor: .appGreen, imageName: "map.circle", title: "Сложный \nмаршрут") {
                elementsPressed.toggle()
            }
            ModalViewEx(imageColor: .appWhite, recColor: .appBlue, imageName: "globe", title: "Куда угодно") {
                // Example usage
                let loc = Location()
                if let randomLoc = loc.randomLocation() {
                    textFieldOut = randomLoc
                }
            }
            ModalViewEx(imageColor: .appWhite, recColor: .appDarkBlue, imageName: "calendar", title: "Выходные") {
                elementsPressed.toggle()
            }
            ModalViewEx(imageColor: .appWhite, recColor: .appRed, imageName: "flame", title: "Горячие \nбилеты") {
                elementsPressed.toggle()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(16)
    }

}

#Preview {
    RootView()
}
